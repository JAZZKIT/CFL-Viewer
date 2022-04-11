//
//  TeamVC.swift
//  CFL Viewer
//
//  Created by Denny on 08.04.2022.
//

import UIKit

class TeamVC: UIViewController, UICollectionViewDelegate {
    
    var collectionView: UICollectionView?
    
    var teams: [TeamList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getTeams()
        
        
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        
        guard let collectionView = collectionView else { return }
        
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.register(TeamCell.self, forCellWithReuseIdentifier: TeamCell.reuseID)
        view.addSubviews(collectionView)
    }
    
    private func getTeams() {
        NetworkManager.shared.getTeams { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let team):
                self.teams = team.data
                DispatchQueue.main.async { self.collectionView?.reloadData() }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension TeamVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCell.reuseID, for: indexPath) as! TeamCell
        cell.set(team: teams[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
}

