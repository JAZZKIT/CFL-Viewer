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
    
    let but = UIButton(type: .system)
    
    var matchList: [MatchList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        layout()
        configureTableView()
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
    }
    
    private func getMatch(in year: String) {
        NetworkManager.shared.getMatches(in: year) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let match):
                self.matchList = match.data
                DispatchQueue.main.async { self.tableView.reloadData() }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

extension MatchListVC {
    func layout() {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchCell.reuseID, for: indexPath) as! MatchCell
        cell.set(match: matchList[indexPath.row])
        return cell
    }
}

// MARK: - ChipsCollectionVCDelegate
extension MatchListVC: ChipsCollectionVCDelegate {
    func slectedYear(year: String?) {
        guard let year = year else { return }
        getMatch(in: year)
    }
}
