//
//  UIView+.swift
//  CFL Viewer
//
//  Created by Denny on 04.04.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}


