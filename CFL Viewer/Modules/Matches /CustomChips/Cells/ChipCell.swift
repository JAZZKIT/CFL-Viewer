//
//  ChipCell.swift
//  CFL Viewer
//
//  Created by Denny on 10.04.2022.
//

import UIKit

class ChipCell: UICollectionViewCell {
    
    static let reuseID = "ChipCell"
    
    let yearLabel = UILabel()
    
    var status = false {
        didSet {
            if status {
                self.backgroundColor = #colorLiteral(red: 0.9590077996, green: 0.9689558148, blue: 0.973085463, alpha: 1)
                self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
                yearLabel.textColor = .gray
                
            } else {
                self.backgroundColor = .systemBackground
                self.layer.borderColor = UIColor.systemRed.cgColor
                yearLabel.textColor = .systemRed
            }
        }
    }
    
    func set(year: String) {
        yearLabel.text = year
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemRed.cgColor
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        yearLabel.adjustsFontForContentSizeCategory = true
        yearLabel.textColor = .systemRed
    }
    
    private func layout() {
        addSubview(yearLabel)
        
        NSLayoutConstraint.activate([
            yearLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yearLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
