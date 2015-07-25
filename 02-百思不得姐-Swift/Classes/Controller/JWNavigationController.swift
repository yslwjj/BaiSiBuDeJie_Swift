//
//  JWNavigationController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            
            
            
            let backButton = UIButton()
            backButton.setImage(UIImage(named: "navigationButtonReturn"), forState: .Normal)
            backButton.setImage(UIImage(named: "navigationButtonReturnClick"), forState: .Highlighted)
            backButton.setTitle("返回", forState: .Normal)
            backButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            backButton.setTitleColor(Theme.tintColor, forState: .Highlighted)
            backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
            backButton.sizeToFit()
            
            backButton.addTarget(self, action: Selector("back"), forControlEvents: .TouchUpInside)
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
            
            viewController.hidesBottomBarWhenPushed = true
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func back() {
        popViewControllerAnimated(true)
    }
}
