//
//  JWNewViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWNewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationBar()
        
        view.backgroundColor = Theme.baseBackgroundColor
    }
    
    private func initNavigationBar() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "MainTagSubIcon", highlightedImageName: "MainTagSubIconClick", target: self, action: Selector("leftButtonTapped:"))
    }
    
    func leftButtonTapped(button: UIButton) {
        println("leftButtonTapped")
    }

}
