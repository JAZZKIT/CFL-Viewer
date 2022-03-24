//
//  LocalState.swift
//  CFL Viewer
//
//  Created by Denny on 21.03.2022.
//

import Foundation
import Firebase

enum LocalState {
    private enum Keys: String {
        case hasOnboarded
    }

    static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var isLogin: Bool {
        guard Auth.auth().currentUser != nil else { return false }
        return true
    }
}
