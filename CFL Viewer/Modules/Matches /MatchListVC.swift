//
//  MatchListVC.swift
//  CFL Viewer
//
//  Created by Denny on 01.04.2022.
//

import UIKit

class MatchListVC: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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

}

// MARK: - UITableViewDataSource
extension MatchListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

// MARK: - UITableViewDelegate
extension MatchListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchCell.reuseID, for: indexPath) as! MatchCell
        
        return cell
    }
}
