//
//  MatchListVC.swift
//  CFL Viewer
//
//  Created by Denny on 01.04.2022.
//

import UIKit

class MatchListVC: UIViewController {
    
    let tableView = UITableView()
    
    var collectionVC: ChipsCollectionVC?
    
    let refreshControll = UIRefreshControl()
    
    var selectedYear = "2015"
    
    #warning("but")
    let but = UIButton(type: .system)
    
    var matchList: [MatchList] = []
    
    var isLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        layout()
        configureTableView()
        configureSkeletons()
        configureRefreshContol()
        getMatch(in: "2015")
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionVC = ChipsCollectionVC(collectionViewLayout: layout)
        collectionVC?.chipDelegate = self
    }
    
    private func configureTableView() {
        tableView.rowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(MatchCell.self, forCellReuseIdentifier: MatchCell.reuseID)
        tableView.register(SkeletonCell.self, forCellReuseIdentifier: SkeletonCell.reuseID)
    }
    
    private func getMatch(in year: String) {
        NetworkManager.shared.getMatches(in: year) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let match):
                self.matchList = match.data
                self.isLoaded = true
                DispatchQueue.main.async { self.tableView.reloadData() }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
            
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}

extension MatchListVC {
    private func layout() {
        guard let collectionView = collectionVC?.collectionView else { return }
        
        view.addSubview(tableView)
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureSkeletons() {
        let row = MatchList.makeSkeleton()
        matchList = Array(repeating: row, count: 5)
        //configureTableCells(with: accounts)
    }
    
    private func configureRefreshContol() {
        refreshControll.tintColor = .systemRed
        refreshControll.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableView.refreshControl = refreshControll
    }
}

// MARK: - UITableViewDataSource
extension MatchListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchList.count
    }
}

// MARK: - UITableViewDelegate
extension MatchListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isLoaded {
            let cell = tableView.dequeueReusableCell(withIdentifier: MatchCell.reuseID, for: indexPath) as! MatchCell
            cell.set(match: matchList[indexPath.row])
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonCell.reuseID, for: indexPath) as! SkeletonCell
        
        return cell
    }
}

// MARK: - ChipsCollectionVCDelegate
extension MatchListVC: ChipsCollectionVCDelegate {
    func slectedYear(year: String?) {
        guard let year = year else { return }
        selectedYear = year
        getMatch(in: year)
    }
}

// MARK: - Actions
extension MatchListVC {
    @objc func refreshContent() {
        reset()
        configureSkeletons()
        tableView.reloadData()
        getMatch(in: selectedYear)
    }
    
    private func reset() {
        matchList = []
        isLoaded = false
    }
}
