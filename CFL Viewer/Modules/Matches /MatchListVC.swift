//
//  MatchListVC.swift
//  CFL Viewer
//
//  Created by Denny on 01.04.2022.
//

import UIKit

class MatchListVC: UIViewController {

    let tableView = UITableView()
    
    var matchList: [MatchList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getMatch()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
       tableView.register(MatchCell.self, forCellReuseIdentifier: MatchCell.reuseID)
    }
    
    func getMatch() {
        NetworkManager.shared.getMatches(in: 2015) { [weak self] result in
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
    
    private func configureUIElements(with match: Match) {
        
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
        //print(matchList[0].)
        cell.set(match: matchList[indexPath.row])
        return cell
    }
}
