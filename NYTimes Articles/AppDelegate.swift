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
        UINavigationBar.appearance().backgroundColor = UIColor.gray
        UINavigationBar.appearance().barTintColor = UIColor.gray
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // Remove back button title from navigation bar
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
    }
    
    fileprivate func start() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController")
        self.window?.rootViewController = viewController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Navigation bar
        navigationBarSetup()
        
        // Window intialization
        start()
        
        return true
    }

    
}
