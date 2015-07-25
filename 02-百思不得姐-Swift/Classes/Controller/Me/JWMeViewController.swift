//
//  JWMeViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationBar()
        
        view.backgroundColor = Theme.baseBackgroundColor
    }
    
    private func initNavigationBar() {
        navigationItem.title = "我的"
        
        let nightModeItem = UIBarButtonItem(imageName: "mine-moon-icon", highlightedImageName: "mine-moon-icon-click", target: self, action: Selector("settingButtonTapped:"))
        
        let settingItem = UIBarButtonItem(imageName: "mine-setting-icon", highlightedImageName: "mine-setting-icon-click", target: self, action: Selector("nightModeButtonTapped:"))
        navigationItem.rightBarButtonItems = [settingItem, nightModeItem]
    }
    
    func nightModeButtonTapped(button: UIButton) {
        println("nightModeButtonTapped")
    }
    
    func settingButtonTapped(button: UIButton) {
        println("settingButtonTapped")
    }

}
