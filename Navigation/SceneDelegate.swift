//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Mac Home on 29.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let ws = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: ws.coordinateSpace.bounds)
        window?.windowScene = ws
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }

    func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(named: "lenta"), tag: 0)
    return UINavigationController(rootViewController: feedViewController)
    }
 
    func createLogInViewController() -> UINavigationController {
        let logInViewController = LogInViewController()
        logInViewController.title = "Профиль"
        logInViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 1)
    return UINavigationController(rootViewController: logInViewController)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .systemGray6
        UITabBar.appearance().backgroundColor = .systemGray6
        tabBarController.viewControllers = [createFeedViewController(), createLogInViewController()]
    return tabBarController
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
       
    }


}

