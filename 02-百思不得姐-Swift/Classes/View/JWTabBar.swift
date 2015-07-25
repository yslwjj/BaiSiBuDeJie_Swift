//
//  JWTabBar.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/22.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWTabBar: UITabBar {
    
    weak var publishButton: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        let publishButton = UIButton()
        publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: .Normal)
        publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: .Highlighted)
        publishButton.addTarget(self, action: Selector("buttonTapped:"), forControlEvents: .TouchUpInside)
        addSubview(publishButton)
        self.publishButton = publishButton
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let BarWidth = frame.size.width
        let BarHeight = frame.size.height
        
        publishButton.bounds.size = publishButton.currentBackgroundImage!.size
        publishButton.center = CGPoint(x: BarWidth / 2, y: BarHeight / 2)
        
        let ButtonWidth = (BarWidth) / 5
        let ButtonHeight = BarHeight
        let ButtonY: CGFloat = 0.0
        
        var index = 0
        for view in subviews as! [UIView] {
            // 如果是UITabBarButton同时不是publishButton就跳过
            if !(view is UIControl) || view == publishButton { continue }
            
            let buttonX = CGFloat(index) * ButtonWidth
            view.frame = CGRect(x: buttonX, y: ButtonY, width: ButtonWidth, height: ButtonHeight)
            
            if index == 1 { index++ }
            
            index++
        }
    }
    
    func buttonTapped(button: UIButton) {
        println("buttonTapped")
    }

}
