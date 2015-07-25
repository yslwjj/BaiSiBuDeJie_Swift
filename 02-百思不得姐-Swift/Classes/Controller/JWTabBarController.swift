//
//  JWTabBarController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
     
        setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        setValue(JWTabBar(), forKey: "tabBar")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initChildViewControllers()
    }
    
    private func initChildViewControllers() {
        let essenceController = JWEssenceViewController()
        addChildViewController(essenceController, title: "精华",
            image: UIImage(named: "tabBar_essence_icon")!,
            selectedImage: UIImage(named: "tabBar_essence_click_icon")!)
        
        let newController = JWNewViewController()
        addChildViewController(newController, title: "新帖",
            image: UIImage(named: "tabBar_new_icon")!,
            selectedImage: UIImage(named: "tabBar_new_click_icon")!)
        
        let friendController = UIStoryboard.friendsTrendController()
        addChildViewController(friendController, title: "关注",
            image: UIImage(named: "tabBar_friendTrends_icon")!,
            selectedImage: UIImage(named: "tabBar_friendTrends_click_icon")!)
        
        let meController = JWMeViewController()
        addChildViewController(meController, title: "我",
            image: UIImage(named: "tabBar_me_icon")!,
            selectedImage: UIImage(named: "tabBar_me_click_icon")!)
    }
    
    private func addChildViewController(controller: UIViewController, title: String, image: UIImage, selectedImage: UIImage) {
        
        controller.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectedImage
        
        let navController = JWNavigationController(rootViewController: controller)
        
        addChildViewController(navController)
    }

}
