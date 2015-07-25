//
//  Channel.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/23.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import Foundation

class RecommendChannel: NSObject {
    
    var count: Int
    var id: String
    var name: String
    
    var friends = [RecommendFriend]()
    var currentPage = 1
    var total = 0
    
    init(dictionary: [String: AnyObject]) {
        let countStr = dictionary[ApiClient.JSONResponseKeys.RecommendChannelCount] as! String
        count = countStr.toInt()!
        id = dictionary[ApiClient.JSONResponseKeys.RecommendChannelId] as! String
        name = dictionary[ApiClient.JSONResponseKeys.RecommendChannelName] as! String
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of Channel objects */
    static func channelsFromResults(results: [[String : AnyObject]]) -> [RecommendChannel] {
        var channels = [RecommendChannel]()
        
        for result in results {
            channels.append(RecommendChannel(dictionary: result))
        }
        
        return channels
    }

    
}
