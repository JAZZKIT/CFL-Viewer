//
//  TeamInfoVC.swift
//  CFL Viewer
//
//  Created by Denny on 12.04.2022.
//

import UIKit

class TeamInfoVC: UIViewController {
    
    var teamImageView = UIImageView()
    var teamTitleLabel = UILabel()
    var teamBioLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        style()
        layout()
    }
    
    private func configureController() {
        view.backgroundColor = .systemBackground
        title = teamTitleLabel.text
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
    }
}

extension TeamInfoVC {
    private func style() {
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        teamImageView.contentMode = .scaleAspectFit
        
        teamTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        teamTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        teamTitleLabel.adjustsFontForContentSizeCategory = true
        teamTitleLabel.textColor = .black
        
        teamBioLabel.translatesAutoresizingMaskIntoConstraints = false
        teamBioLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        teamBioLabel.adjustsFontForContentSizeCategory = true
        teamBioLabel.textColor = .black
        teamBioLabel.numberOfLines = 0
        teamBioLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    }
    
    private func layout() {
        view.addSubviews(teamImageView, teamTitleLabel, teamBioLabel)
        
        NSLayoutConstraint.activate([
            teamImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            teamTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamTitleLabel.topAnchor.constraint(equalTo: teamImageView.bottomAnchor, constant: 0),
            
            teamBioLabel.topAnchor.constraint(equalTo: teamTitleLabel.bottomAnchor, constant: 20),
            teamBioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            teamBioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),            
        ])
        
    }
}

// MARK: - Actions
extension TeamInfoVC {
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}


