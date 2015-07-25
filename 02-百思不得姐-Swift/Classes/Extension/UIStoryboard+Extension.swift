//
//  UIStoryboard+Extension.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func friendsTrendController() -> UIViewController {
        let storyboard = UIStoryboard(name: "FriendsTrend", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UIViewController
    }
    
    class func essenceController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Essence", bundle: nil)
        return storyboard.instantiateInitialViewController() as! UITableViewController
    }
}
