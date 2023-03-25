//
//  AppDelegate.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 24/03/23.
//

import UIKit

//@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = LoginViewController()
        let navController = UINavigationController(rootViewController: vc)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDefaultsManager.lastAppClose = Date().timeIntervalSince1970
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        UserDefaultsManager.lastAppClose = Date().timeIntervalSince1970
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        evalueBlockToLogin()
    }
    
    func getTopViewController() -> UIViewController{
        return UIApplication.shared.keyWindow?.rootViewController ??  UIViewController()
    }
    
    func evalueBlockToLogin() {
        let currentTime = Int(Date().timeIntervalSince1970)
        
        if ((currentTime - Int(UserDefaultsManager.lastAppClose) ) > Int(toleranceToBlock)) {
            let vc = LoginViewController()
            getTopViewController().navigationController?.pushViewController(vc, animated: true)
        }
    }
}

