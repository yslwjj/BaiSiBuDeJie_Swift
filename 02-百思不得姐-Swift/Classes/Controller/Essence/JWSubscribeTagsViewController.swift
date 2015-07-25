//
//  JWSubscribeTagsViewController.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/24.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit
import SVProgressHUD

class JWSubscribeTagsViewController: UITableViewController {
    struct CellIdentifier {
        static let Subscribe = "subscribeCell"
        static let Unsbuscribe = "unsubscribeCell"
    }
    
    var defTags: [SubscribeTag]!
    var recTags: [SubscribeTag]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = Theme.baseBackgroundColor
        tableView.rowHeight = 70
        title = "标签订阅"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("rightItemTapped:"))
        
        // 去掉返回箭头
        if let backButton = navigationItem.leftBarButtonItem?.customView as? UIButton {
            backButton.setImage(nil, forState: .Normal)
            backButton.setImage(nil, forState: .Highlighted)
        }
        
        SVProgressHUD.showWithMaskType(.Gradient)
        ApiClient.sharedInstance.getSubscribeTags { defTags, recTags, error in
            
            dispatch_async(dispatch_get_main_queue()) {
                SVProgressHUD.dismiss()
            }
            
            if let error = error {
                println("加载推荐标签错误: \(error)")
            } else {
                
                self.defTags = defTags
                self.recTags = recTags
                
                dispatch_async(dispatch_get_main_queue()){
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func rightItemTapped(sender: UIBarButtonItem) {
        performSegueWithIdentifier("recommendSubscribeSegue", sender: nil)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let defTags = defTags, let recTags = recTags {
            if section == 0 {
                return recTags.count
            } else if section == 1 {
                return defTags.count
            }
        }
        
        return 0
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var tag: SubscribeTag?
        
        if indexPath.section == 0 {
            
            let tag = recTags[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.Subscribe) as! JWSubscribeTagsCell
            cell.subscribeTag = tag
            
            return cell
            
        } else  {
            
            let tag = defTags[indexPath.row]
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.Unsbuscribe) as! JWSubscribeTagsCell
            cell.subscribeTag = tag
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.clearColor()
        
        if section == 0 {
            
            let header = JWSubscribeTagsHeader(frame: CGRect(x: 5, y: 0, width: view.frame.width - 10, height: view.frame.height))
            header.backgroundColor = UIColor.whiteColor()
            header.setTitle("推荐标签", forState: .Normal)
            header.setTitleColor(UIColor(red: 67, green: 67, blue: 67), forState: .Normal)
            header.setImage(UIImage(named: "accessory"), forState: .Normal)
            header.addTarget(self, action: Selector("headerTapped:"), forControlEvents: .TouchUpInside)
            
            view.addSubview(header)
            
        } else if section == 1 {
            let label = UILabel(frame: CGRect(x: 5, y: 0, width: view.frame.width - 10, height: view.frame.height))
            label.backgroundColor = UIColor.whiteColor()
            label.textColor = UIColor(red: 67, green: 67, blue: 67)
            label.text = "  已订阅标签--根据标签推荐你喜欢的内容"
            view.addSubview(label)
        }
        
        return view
    }
    
    func headerTapped(button: UIButton) {
        performSegueWithIdentifier("recommendSubscribeSegue", sender: nil)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        
        return view
    }
    
}
