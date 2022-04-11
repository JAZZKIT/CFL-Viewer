//
//  TeamCell.swift
//  CFL Viewer
//
//  Created by Denny on 08.04.2022.
//

import UIKit

class TeamCell: UICollectionViewCell {
    
    static let reuseID = "TeamCell"
    
    let teamImage = UIImageView()
    let teamLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(team: TeamList) {
        NetworkManager.shared.downloadImage(from: team.images?.gametrackerSmallImageUrl ?? "") { [weak self] image in
            guard let self = self else { return }
            self.teamImage.image = image
        }
        teamLabel.text = team.nickname
    }
    
    private func configure() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 3
        self.layer.borderColor = #colorLiteral(red: 0.9577421546, green: 0.9527757764, blue: 0.9571701884, alpha: 1).cgColor
        
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        teamImage.contentMode = .scaleAspectFit
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        teamLabel.adjustsFontForContentSizeCategory = true
        teamLabel.textColor = .black
    }
    
    private func layout() {
        addSubviews(teamImage, teamLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            teamImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            teamImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            teamImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            teamImage.heightAnchor.constraint(equalToConstant: 100),
            
            teamLabel.topAnchor.constraint(equalTo: teamImage.bottomAnchor, constant: 12),
            teamLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            teamLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
