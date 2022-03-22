//
//  SceneDelegate.swift
//  CFL Viewer
//
//  Created by Denny on 18.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let onboardingContainerVC = OnboardingContainerVC()
    let loginVC = LoginVC()
    let homeVC = HomeVC()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()

//        loginVC.delegate = self
        onboardingContainerVC.delegateOnboarding = self
        
//        registerForNotification()
//
        displayNextScreen()
    }
    
    private func displayLogin() {
        setRootVC(loginVC)
    }

    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepHomeView()
            setRootVC(loginVC)
        } else {
            setRootVC(onboardingContainerVC)
        }
    }
//
//    private func registerForNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .Logout, object: nil)
//    }
//
    private func prepHomeView() {
        //mainVC.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        //UINavigationBar.appearance().backgroundColor = appColor
    }

}

//// MARK: - LoginVCDelegate
//extension SceneDelegate: LoginVCDelegate {
//    func didLogin() {
//        displayNextScreen()
//    }
//}
//
// MARK: - OnboardingContainerVCDelegate
extension SceneDelegate: OnboardingContainerVCDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepHomeView()
        setRootVC(loginVC)
    }
}

//// MARK: - LogoutDelegate
//extension SceneDelegate: LogoutDelegate {
//    @objc func didLogout() {
//        setRootVC(loginVC)
//    }
//}

extension SceneDelegate {
    func setRootVC(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
