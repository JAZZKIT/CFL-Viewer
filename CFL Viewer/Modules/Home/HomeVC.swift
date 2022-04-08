//
//  HomeVC.swift
//  CFL Viewer
//
//  Created by Denny on 20.03.2022.
//

import UIKit
import Firebase

class HomeVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        viewControllers  = [createMatchNC(), createPlayesNC(), createTeamNC()]
    }
    
    func createMatchNC() -> UINavigationController {
        let matchListVC = MatchListVC()
        matchListVC.title = "Matchs"
        matchListVC.setTabBarImage(imageName: "calendar", title: "Matchs")
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        matchListVC.navigationItem.rightBarButtonItem = logoutButton
       
        return UINavigationController(rootViewController: matchListVC)
    }
    
    func createPlayesNC() -> UINavigationController {
        let playerVC = PlayerVC()
        playerVC.title = "Players"
        playerVC.setTabBarImage(imageName: "person", title: "Players")
        
        return UINavigationController(rootViewController: playerVC)
    }
    
    func createTeamNC() -> UINavigationController {
        let teamVC = TeamVC()
        teamVC.title = "Teams"
        teamVC.setTabBarImage(imageName: "person.3", title: "Teams")
        
        return UINavigationController(rootViewController: teamVC)
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .systemRed
        tabBar.isTranslucent = false
    }
    
}

// MARK: - Actions
extension HomeVC {
    @objc func logoutTapped(sender: UIButton) {
        NetworkManager.shared.getMatches(in: 2015) { [weak self] result in
            guard let self = self else { return }
            //self.dismissLoadingView()
            
            switch result {
            case .success(let data):
                print(data.data.count)
            case .failure(let error):
                print(error)
                //self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
//
//        let firebaseAuth = Auth.auth()
//        do
//            try firebaseAuth.signOut()
//            NotificationCenter.default.post(name: .Logout, object: nil)
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
    }
}
