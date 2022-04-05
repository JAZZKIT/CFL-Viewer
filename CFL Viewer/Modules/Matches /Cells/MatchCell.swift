//
//  MatchCell.swift
//  CFL Viewer
//
//  Created by Denny on 02.04.2022.
//

import UIKit

class MatchCell: UITableViewCell {
        
    static let reuseID = "MatchCell"
    
    let contentViewCell = UIView()
    let dateLabel = UILabel()
    let dividerTop = UIView()
    let matchStackView = UIStackView()
    let team1Image = UIImageView()
    let team2Image = UIImageView()
    let scoreStackView = UIStackView()
    let scoreLabel = UILabel()
    let typeGameLabel = UILabel()
    let dividerBottom = UIView()
    let venueLabel = UILabel()
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func set(favorite: Follower) {
//        usernameLabel.text = favorite.login
//        avatarImageView.downloadImage(fromURL: favorite.avatarUrl)
//    }
    
    private func configure() {
        contentViewCell.translatesAutoresizingMaskIntoConstraints = false
        contentViewCell.backgroundColor = #colorLiteral(red: 0.2078429163, green: 0.2078433037, blue: 0.216439724, alpha: 1)
        contentViewCell.clipsToBounds = true
        contentViewCell.layer.cornerRadius = 7
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        dateLabel.adjustsFontForContentSizeCategory = true
        dateLabel.textColor = .white
        dateLabel.text = "test 1"
        
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        scoreStackView.axis = .vertical
        scoreStackView.spacing = 10
        
        dividerTop.translatesAutoresizingMaskIntoConstraints = false
        dividerTop.backgroundColor = .white
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        scoreLabel.adjustsFontForContentSizeCategory = true
        scoreLabel.textColor = .white
        scoreLabel.text = "11 - 21"
        
        typeGameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeGameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        typeGameLabel.adjustsFontForContentSizeCategory = true
        typeGameLabel.textColor = .white
        typeGameLabel.text = "putin dead"
        
        matchStackView.translatesAutoresizingMaskIntoConstraints = false
        matchStackView.axis = .horizontal
        matchStackView.spacing = 20
        
        team1Image.translatesAutoresizingMaskIntoConstraints = false
        team1Image.image = UIImage(named: "Elks")
        team2Image.translatesAutoresizingMaskIntoConstraints = false
        team2Image.image = UIImage(named: "Blue Bombers")
        
        dividerBottom.translatesAutoresizingMaskIntoConstraints = false
        dividerBottom.backgroundColor = .white
        
        venueLabel.translatesAutoresizingMaskIntoConstraints = false
        venueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        venueLabel.adjustsFontForContentSizeCategory = true
        venueLabel.textColor = .white
        venueLabel.text = "Ukraine"
    }
    
    private func layout() {
        scoreStackView.addArrangedSubview(scoreLabel)
        scoreStackView.addArrangedSubview(typeGameLabel)
        matchStackView.addArrangedSubview(team1Image)
        matchStackView.addArrangedSubview(scoreStackView)
        matchStackView.addArrangedSubview(team2Image)
        contentViewCell.addSubviews(dateLabel, dividerTop, matchStackView, dividerBottom, venueLabel)
        addSubview(contentViewCell)
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            contentViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            contentViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            contentViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            contentViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            
            dateLabel.centerXAnchor.constraint(equalTo: contentViewCell.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: padding),
            
            dividerTop.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            dividerTop.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor),
            dividerTop.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor),
            dividerTop.heightAnchor.constraint(equalToConstant: 1),
            
            team1Image.heightAnchor.constraint(equalToConstant: 60),
            team1Image.widthAnchor.constraint(equalToConstant: 60),
            
            team2Image.heightAnchor.constraint(equalToConstant: 60),
            team2Image.widthAnchor.constraint(equalToConstant: 60),
            
            matchStackView.topAnchor.constraint(equalTo: dividerTop.bottomAnchor, constant: padding),
            matchStackView.centerXAnchor.constraint(equalTo: contentViewCell.centerXAnchor),
            
            dividerBottom.topAnchor.constraint(equalTo: matchStackView.bottomAnchor, constant: padding),
            dividerBottom.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor),
            dividerBottom.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor),
            dividerBottom.heightAnchor.constraint(equalToConstant: 1),
            
            venueLabel.topAnchor.constraint(equalTo: dividerBottom.bottomAnchor, constant: padding),
            venueLabel.centerXAnchor.constraint(equalTo: contentViewCell.centerXAnchor),
            venueLabel.bottomAnchor.constraint(equalTo: contentViewCell.bottomAnchor, constant: -padding)
        ])
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
