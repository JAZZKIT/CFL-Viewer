//
//  TeamVC.swift
//  CFL Viewer
//
//  Created by Denny on 08.04.2022.
//

import UIKit

class TeamVC: UIViewController {
    
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
        collectionView.delegate = self
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

extension TeamVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let teamInfoVC = TeamInfoVC()
        let navController = UINavigationController(rootViewController: teamInfoVC)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? TeamCell {
            
            teamInfoVC.teamTitleLabel.text = cell.teamLabel.text
            teamInfoVC.teamImageView.image = cell.teamImage.image
            navController.title = "SJLIFJIFJWJF;JAOFjg"
            navController.navigationBar.tintColor = .green
            //cell.teamLabel = teamInfoVC.teamTitleLabel
        }
        
        
        
        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = nil
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
//            sheet.prefersEdgeAttachedInCompactHeight = true
//            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        
        present(navController, animated: true, completion: nil)
    }
}

// MARK: - Actions
extension TeamVC {
    private func prepareTeamInfoSheet() {

    }
}
