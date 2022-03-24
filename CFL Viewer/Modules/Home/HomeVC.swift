//
//  HomeVC.swift
//  CFL Viewer
//
//  Created by Denny on 20.03.2022.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    
    let logButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        logOutTest()
        layout()
    }
    
    func logOutTest() {
        view.addSubview(logButton)
        logButton.translatesAutoresizingMaskIntoConstraints = false
        logButton.configuration = .filled()
        logButton.configuration?.imagePadding = 8
        logButton.setTitle("logOut", for: .normal)
        logButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            logButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureViewController() {
        view.backgroundColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(logoutTapped))
//        navigationItem.rightBarButtonItem = addButton
    }
    
}

// MARK: - Actions
extension HomeVC {
    @objc func logoutTapped(sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            NotificationCenter.default.post(name: .Logout, object: nil)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
