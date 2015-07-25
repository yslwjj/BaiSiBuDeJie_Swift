//
//  JWSubscribeTagsHeader.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/25.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWSubscribeTagsHeader: UIButton {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 10
        titleLabel?.center.y = center.y
        
        imageView?.frame.origin.x = CGRectGetWidth(frame) - (imageView!.image!.size.width + 10)
        imageView?.center.y = center.y
    }

}
