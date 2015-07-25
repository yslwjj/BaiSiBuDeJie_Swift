//
//  JWFriendCell.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/24.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit
import Kingfisher

class JWFriendCell: UITableViewCell {
    
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fansCountLabel: UILabel!
    
    var friend: RecommendFriend? {
        didSet {
            if let friend = friend {
                headImageView.kf_setImageWithURL(NSURL(string: friend.header)!, placeholderImage: UIImage(named: "defaultUserIcon"))
                nameLabel.text = friend.name
                fansCountLabel.text = "\(friend.fansCount)人关注"
            }
        }
    }
    
    @IBAction func subscribe() {
        
    }

}
