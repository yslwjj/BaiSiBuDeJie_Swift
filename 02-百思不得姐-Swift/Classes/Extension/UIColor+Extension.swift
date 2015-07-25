//
//  UIColor+Extension.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
}
