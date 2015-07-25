//
//  JWFriendsViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWFriendsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        
        view.backgroundColor = Theme.baseBackgroundColor
    }
    
    private func initNavigationBar() {
        navigationItem.title = "我的关注"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "friendsRecommentIcon", highlightedImageName: "friendsRecommentIcon-click", target: self, action: Selector("leftButtonTapped:"))
    }
    
    func leftButtonTapped(button: UIButton) {
        performSegueWithIdentifier("ShowRecommend", sender: nil)
    }

}
