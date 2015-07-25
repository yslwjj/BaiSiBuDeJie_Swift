//
//  UIBarButtonItem+Extension.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName: String?, highlightedImageName: String?, title: String?, target: AnyObject?, action: Selector) {
    
        let button = UIButton()
        if let imageName = imageName, highlightedImageName = highlightedImageName {
            button.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
            button.setBackgroundImage(UIImage(named: highlightedImageName), forState: .Highlighted)
        }
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        self.init(customView: button)
    }
    
    convenience init(title: String, target: AnyObject?, action: Selector) {
        self.init(imageName: nil, highlightedImageName: nil, title: title, target: target, action: action)
    }
    
    convenience init(imageName: String, highlightedImageName: String, target: AnyObject?, action: Selector) {
        self.init(imageName: imageName, highlightedImageName: highlightedImageName, title: nil, target: target, action: action)
    }
    
}
