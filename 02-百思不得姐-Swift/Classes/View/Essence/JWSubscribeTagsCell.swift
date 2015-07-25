//
//  JWSubscribeTagsCell.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/25.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit
import Kingfisher

class JWSubscribeTagsCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subNumLabel: UILabel!
    @IBOutlet weak var picImageView: UIImageView!
    
    var subscribeTag: SubscribeTag? {
        didSet {
            if let subscribeTag = subscribeTag {
                nameLabel.text = subscribeTag.name
                
                if subscribeTag.subscribeNumber > 10000 {
                    
                    let text = String(format: "%.1f万人订阅", Float(subscribeTag.subscribeNumber) / 10000.0)
                    
                    subNumLabel.text = text
                } else {
                    subNumLabel.text = "\(subscribeTag.subscribeNumber)人订阅"
                }
                
                picImageView.kf_setImageWithURL(NSURL(string: subscribeTag.imagePath)!, placeholderImage: UIImage(named: "defaultTagIcon"))
                
            }
        }
    }
    
    override func awakeFromNib() {
        picImageView.layer.cornerRadius = 5.0
        picImageView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame.origin.x += 5
        contentView.frame.size.width -= 10
        contentView.frame.size.height -= 1
    }

}
