//
//  AppDelegate.swift
//  ChitChat
//
//  Created by Epos Admin on 01/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //MARK: -- Rechability Methods for InterNet Connectivity Checking
    func interNetConnectivity() -> Bool {
        
        let networkReachability = Reachability.init()
        let networkStatus = networkReachability?.currentReachabilityStatus
        if networkStatus == .notReachable {
            return false
        }
        else
        {
            return true
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") //LoginViewController //RegistrationViewController
        //let navController = UINavigationController.init(rootViewController: viewController)
        //self.window?.rootViewController = navController
        
        
        let navigationController = NavigationController(rootViewController:viewController) //MerchantHomeViewController //HomeViewController
        let mainViewController = MainViewController()
        mainViewController.rootViewController = navigationController
        mainViewController.setup(type: UInt(2))
        self.window?.rootViewController = mainViewController
        UIView.transition(with: self.window!, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

