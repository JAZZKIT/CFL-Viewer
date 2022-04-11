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
    
    func set(match: MatchList) {
        dateLabel.text = match.dateStart?.convertToDisplayFormat()
        scoreLabel.text = "\(match.team1?.score ?? 0) - \(match.team2?.score ?? 0)"
        typeGameLabel.text = match.eventType?.name
        venueLabel.text = match.venue?.name
        team1Image.setTeam(team1Image, with: match.team1?.nickname)
        team1Image.setTeam(team2Image, with: match.team2?.nickname)
    }
    
    private func configure() {
        contentViewCell.translatesAutoresizingMaskIntoConstraints = false
        contentViewCell.backgroundColor = #colorLiteral(red: 0.2078429163, green: 0.2078433037, blue: 0.216439724, alpha: 1)
        contentViewCell.clipsToBounds = true
        contentViewCell.layer.cornerRadius = 7
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        dateLabel.adjustsFontForContentSizeCategory = true
        dateLabel.textColor = .white
        
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        scoreStackView.axis = .vertical
        scoreStackView.spacing = 10
        
        dividerTop.translatesAutoresizingMaskIntoConstraints = false
        dividerTop.backgroundColor = .white
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        scoreLabel.adjustsFontForContentSizeCategory = true
        scoreLabel.textColor = .white
        
        typeGameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeGameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        typeGameLabel.adjustsFontForContentSizeCategory = true
        typeGameLabel.textColor = .white
        
        matchStackView.translatesAutoresizingMaskIntoConstraints = false
        matchStackView.axis = .horizontal
        matchStackView.spacing = 20
        
        team1Image.translatesAutoresizingMaskIntoConstraints = false
        team1Image.contentMode = .scaleAspectFit
        team2Image.translatesAutoresizingMaskIntoConstraints = false
        team2Image.contentMode = .scaleAspectFit
        
        dividerBottom.translatesAutoresizingMaskIntoConstraints = false
        dividerBottom.backgroundColor = .white
        
        venueLabel.translatesAutoresizingMaskIntoConstraints = false
        venueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        venueLabel.adjustsFontForContentSizeCategory = true
        venueLabel.textColor = .white
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
}
