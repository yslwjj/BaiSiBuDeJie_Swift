//
//  JWRecommendTagsViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/25.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit
import SVProgressHUD

class JWRecommendTagsViewController: UITableViewController {
    let ReusableIdentifier = "recommendTagCell"
    
    var recommendTags: [SubscribeTag]!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "推荐标签"
        tableView.backgroundColor = Theme.baseBackgroundColor
        
        // 去掉返回箭头
        if let backButton = navigationItem.leftBarButtonItem?.customView as? UIButton {
            backButton.setImage(nil, forState: .Normal)
            backButton.setImage(nil, forState: .Highlighted)
        }
        
        SVProgressHUD.showWithMaskType(.Gradient)
        ApiClient.sharedInstance.getRecommnedTags { result, error in
            
            dispatch_async(dispatch_get_main_queue()) {
                SVProgressHUD.dismiss()
            }
            
            if let tags = result {
                self.recommendTags = tags
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            } else {
                println("获取推荐标签失败: \(error)")
            }
            
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let tags = recommendTags {
            return tags.count
        }
        
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ReusableIdentifier) as! JWSubscribeTagsCell
        
        let tag = recommendTags[indexPath.row]
        cell.subscribeTag = tag

        return cell
    }


}
