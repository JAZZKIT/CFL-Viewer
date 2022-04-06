//
//  UIImageView.swift
//  CFL Viewer
//
//  Created by Denny on 06.04.2022.
//

import UIKit

extension UIImageView {
    func setTeam(_ team: UIImageView?, with image: String?) {
        team?.image = UIImage(named: image!)
    }
}
