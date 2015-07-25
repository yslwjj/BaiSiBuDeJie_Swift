//
//  JWRecommendContainerViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/24.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class JWRecommendContainerViewController: UIViewController {
    
    var channelController: JWRecommendChannelViewController!
    var friendsController: JWRecommendFriendsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "推荐关注"
        view.backgroundColor = Theme.baseBackgroundColor
        
        channelController.delegate = friendsController
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "channelEmbedSegue" {
            
            if let controller = segue.destinationViewController as? JWRecommendChannelViewController {
                channelController = controller
            }
            
            
        } else if segue.identifier == "friendsEmbedSegue" {
            
            if let controller = segue.destinationViewController as? JWRecommendFriendsViewController {
                friendsController = controller
            }
        }
    }

}
