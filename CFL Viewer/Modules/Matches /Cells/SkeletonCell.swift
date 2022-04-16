//
//  SkeletonCell.swift
//  CFL Viewer
//
//  Created by Denny on 16.04.2022.
//

import UIKit

extension SkeletonCell: SkeletonLoadable {}

class SkeletonCell: UITableViewCell {
        
    static let reuseID = "SkeletonCell"
    
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
 
    // Gradients
    let dateLayer = CAGradientLayer()
    let image1Layer = CAGradientLayer()
    let image2Layer = CAGradientLayer()
    let scoreLayer = CAGradientLayer()
    let typeGameLayer = CAGradientLayer()
    let venueLayer = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setupLayers()
        setupAnimation()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        dateLayer.frame = dateLabel.bounds
        dateLayer.cornerRadius = dateLabel.bounds.height/2

        image1Layer.frame = team1Image.bounds
        image1Layer.cornerRadius = team1Image.bounds.height/2
        
        image2Layer.frame = team2Image.bounds
        image2Layer.cornerRadius = team2Image.bounds.height/2

        scoreLayer.frame = scoreLabel.bounds
        scoreLayer.cornerRadius = scoreLabel.bounds.height/2

        typeGameLayer.frame = typeGameLabel.bounds
        typeGameLayer.cornerRadius = typeGameLabel.bounds.height/2
        
        venueLayer.frame = venueLabel.bounds
        venueLayer.cornerRadius = venueLabel.bounds.height/2
    }
    
    private func setupLayers() {
        dateLayer.startPoint = CGPoint(x: 0, y: 0.5)
        dateLayer.endPoint = CGPoint(x: 1, y: 0.5)
        dateLabel.layer.addSublayer(dateLayer)

        image1Layer.startPoint = CGPoint(x: 0, y: 0.5)
        image1Layer.endPoint = CGPoint(x: 1, y: 0.5)
        team1Image.layer.addSublayer(image1Layer)
        
        image2Layer.startPoint = CGPoint(x: 0, y: 0.5)
        image2Layer.endPoint = CGPoint(x: 1, y: 0.5)
        team2Image.layer.addSublayer(image2Layer)

        scoreLayer.startPoint = CGPoint(x: 0, y: 0.5)
        scoreLayer.endPoint = CGPoint(x: 1, y: 0.5)
        scoreLabel.layer.addSublayer(scoreLayer)
        
        typeGameLayer.startPoint = CGPoint(x: 0, y: 0.5)
        typeGameLayer.endPoint = CGPoint(x: 1, y: 0.5)
        typeGameLabel.layer.addSublayer(typeGameLayer)

        venueLayer.startPoint = CGPoint(x: 0, y: 0.5)
        venueLayer.endPoint = CGPoint(x: 1, y: 0.5)
        venueLabel.layer.addSublayer(venueLayer)
    }

    private func setupAnimation() {
        let dateGroup = makeAnimationGroup()
        dateGroup.beginTime = 0.0
        dateLayer.add(dateGroup, forKey: "backgroundColor")

        let image1Group = makeAnimationGroup(previousGroup: dateGroup)
        image1Layer.add(image1Group, forKey: "backgroundColor")

        let image2Group = makeAnimationGroup(previousGroup: image1Group)
        image2Layer.add(image2Group, forKey: "backgroundColor")

        let scoreGroup = makeAnimationGroup(previousGroup: image2Group)
        scoreLayer.add(scoreGroup, forKey: "backgroundColor")
        
        let typeGameGroup = makeAnimationGroup(previousGroup: scoreGroup)
        typeGameLayer.add(typeGameGroup, forKey: "backgroundColor")
        
        let venueGroup = makeAnimationGroup(previousGroup: typeGameGroup)
        venueLayer.add(venueGroup, forKey: "backgroundColor")
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
        dateLabel.text = "           "
        
        scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        scoreStackView.axis = .vertical
        scoreStackView.spacing = 10
        
        scoreLabel.text = "                 "
        
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
        typeGameLabel.text = "           "
        
        matchStackView.translatesAutoresizingMaskIntoConstraints = false
        matchStackView.axis = .horizontal
        matchStackView.spacing = 20
        
        team1Image.translatesAutoresizingMaskIntoConstraints = false
        team1Image.contentMode = .scaleAspectFit
        team1Image.image = UIImage(named: "Alouettes")
        team2Image.translatesAutoresizingMaskIntoConstraints = false
        team2Image.contentMode = .scaleAspectFit
        team2Image.image = UIImage(named: "Alouettes")
        
        dividerBottom.translatesAutoresizingMaskIntoConstraints = false
        dividerBottom.backgroundColor = .white
        
        venueLabel.translatesAutoresizingMaskIntoConstraints = false
        venueLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        venueLabel.adjustsFontForContentSizeCategory = true
        venueLabel.textColor = .white
        venueLabel.text = "                                                           "
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
