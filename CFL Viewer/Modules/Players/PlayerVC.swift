//
//  PlayerVC.swift
//  CFL Viewer
//
//  Created by Denny on 01.04.2022.
//

import UIKit
import WebKit

class PlayerVC: UIViewController {
    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    private func configure() {
        view.addSubview(webView)
        
        guard let url = URL(string: "https://www.cfl.ca/players/") else {
            presentGFAlertOnMainThread(title: "Something went wrong", message: "", buttonTitle: "OK")
            return
        }
        
        webView.load(URLRequest(url: url))
    }
}
