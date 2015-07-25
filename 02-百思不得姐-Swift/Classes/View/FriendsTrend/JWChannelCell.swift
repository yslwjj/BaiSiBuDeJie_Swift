//
//  JWChannelTableViewCell.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/23.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWChannelCell: UITableViewCell {

    @IBOutlet weak var indicatorView: UIView!
    
    var channel: RecommendChannel? {
        didSet {
            if let channel = channel {
                self.textLabel?.text = channel.name
            }
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        indicatorView.hidden = !selected
        textLabel?.textColor = selected ? Theme.tintColor : UIColor.blackColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel!.frame.origin.y += 1.0
        textLabel!.frame.size.height -= 2.0
    }

}
