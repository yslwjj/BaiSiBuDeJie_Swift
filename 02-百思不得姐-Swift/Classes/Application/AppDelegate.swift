//
//  AppDelegate.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.rootViewController = JWTabBarController()
        
        window?.backgroundColor = UIColor.whiteColor()
        window?.makeKeyAndVisible()
        
        configureAppearance()
        return true
    }
    
    func configureAppearance() {
        
        // TabBar
        UITabBar.appearance().backgroundImage = UIImage(named: "tabbar-light")
        
        // TabBarItem
        let tabBarItem = UITabBarItem.appearance()
        tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName: Theme.tabBarTextColor], forState: .Normal)
        tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName: Theme.tabBarSelectedTextColor], forState: .Selected)
        
        // NavigationBar
        let navBar = UINavigationBar.appearance()
        navBar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: .Default)
        let navTextAttrs = [NSFontAttributeName: UIFont.systemFontOfSize(20, weight: 20)]
        navBar.titleTextAttributes = navTextAttrs
        
        // UIBarButtonItem
        let barButtonItem = UIBarButtonItem.appearance()
        barButtonItem.setTitleTextAttributes([NSForegroundColorAttributeName: Theme.tintColor], forState: .Normal)
        barButtonItem.tintColor = UIColor.blackColor()
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

