//
//  JWRecommendFriendsViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/24.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit
import MJRefresh

class JWRecommendFriendsViewController: UITableViewController {
    let ReusableIdentifier = "RecommendFriendCell"
    
    var selectedChannel: RecommendChannel!
    var loadTask: NSURLSessionDataTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 71
        
        setupRefresh()
    }
    
    func setupRefresh() {
        tableView.header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("loadNewestFriends"))
        
        tableView.footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: Selector("loadMoreFriends"))
        tableView.footer.hidden = true
    }
    
    // 加载最新的推荐关注
    func loadNewestFriends() {
        
        loadTask?.cancel()
        
        loadTask = ApiClient.sharedInstance.getRecommendFriends(selectedChannel.id) { total, result, error in
            
            // 任务被取消，直接返回
            if error?.code == -999 { return }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.header.endRefreshing()
            }
            
            if let friends = result, total = total {
                self.selectedChannel.friends = friends
                self.selectedChannel.total = total
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            } else {
                println("获取推荐用户失败: \(error)")
            }
        }
    }
    
    // 加载更多的推荐关注
    func loadMoreFriends() {
        
        loadTask?.cancel()
        
        loadTask = ApiClient.sharedInstance.getRecommendFriends(selectedChannel.id,
            page: ++selectedChannel.currentPage) { _, result, error in
            
            // 任务被取消，直接返回
            if error?.code == -999 { return }
            
            if let moreFriends = result {
                self.selectedChannel.friends.extend(moreFriends)
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                    self.checkFooterState()
                }
                
            } else {
                println("加载更多关注用户失败: \(error)")
            }
        }
    }
    
    func checkFooterState() {
        if let channel = selectedChannel {
            tableView.footer.hidden = channel.friends.isEmpty
            
            if channel.total == channel.friends.count {
                tableView.footer.noticeNoMoreData()
            } else {
                tableView.footer.endRefreshing()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        checkFooterState()
        
        if let channel = selectedChannel {
            return selectedChannel.friends.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ReusableIdentifier) as! JWFriendCell
        
        let friend = selectedChannel.friends[indexPath.row]
        cell.friend = friend
        
        return cell
    }
    
    deinit {
        loadTask?.cancel()
        loadTask = nil
    }
}

extension JWRecommendFriendsViewController: JWRecommendChannelViewControllerDelegate {
    func channelViewController(controller: JWRecommendChannelViewController, didSelectChannel channel: RecommendChannel) {
        
        selectedChannel = channel
        
        tableView.header.endRefreshing()
        tableView.footer.endRefreshing()
        tableView.reloadData()
        
        if selectedChannel.friends.isEmpty {
            tableView.header.beginRefreshing()
        }
        
    }
}
