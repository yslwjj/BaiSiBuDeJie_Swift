//
//  JWChannelViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/23.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit
import SVProgressHUD

@objc protocol JWRecommendChannelViewControllerDelegate {
    optional func channelViewController(controller: JWRecommendChannelViewController,
        didSelectChannel channel: RecommendChannel)
}

class JWRecommendChannelViewController: UITableViewController {
    let ReusableIdentifier = "RecommendChannelCell"
    
    var channels = [RecommendChannel]()
    
    weak var delegate: JWRecommendChannelViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SVProgressHUD.showWithMaskType(.Gradient)
        ApiClient.sharedInstance.getRecommendChannels { result, error in
            
            if let channels = result {
                self.channels = channels
                
                dispatch_async(dispatch_get_main_queue()) {
                    SVProgressHUD.dismiss()
                    self.tableView.reloadData()
                    self.tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: .Top)
                    self.delegate?.channelViewController?(self, didSelectChannel: channels[0])
                }
                
            } else {
                println("获取推荐关注频道错误: \(error)")
                
                dispatch_async(dispatch_get_main_queue()) {
                    SVProgressHUD.showErrorWithStatus("获取推荐关注频道错误")
                }
            }
        }
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return channels.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ReusableIdentifier) as! JWChannelCell
        
        let channel = channels[indexPath.row]
        cell.channel = channel
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let channel = channels[indexPath.row]
        delegate?.channelViewController?(self, didSelectChannel: channel)
    }
    

}
