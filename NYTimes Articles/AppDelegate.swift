//
//  AppDelegate.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    fileprivate func navigationBarSetup() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // Remove back button title from navigation bar
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
    }
    
    fileprivate func start() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ArticlesViewController")
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Navigation bar
        navigationBarSetup()
        
        // Window intialization
        start()
        
        return true
    }

    
}
