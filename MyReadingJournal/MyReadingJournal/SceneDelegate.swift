//
//  SceneDelegate.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 05.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
//        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        self.window?.windowScene = windowScene
//
//        let vc = ViewController()
//        let navVC = UINavigationController(rootViewController: vc)
//
//        self.window?.rootViewController = navVC
//        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

