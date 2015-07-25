//
//  RecommendFriend.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/24.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import Foundation

class RecommendFriend {
    
    var header: String
    var fansCount: Int
    var name: String
    
    init(dictionary: [String: AnyObject]) {
        let fansCountStr = dictionary[ApiClient.JSONResponseKeys.RecommendFirendFansCount] as! String
        fansCount = fansCountStr.toInt()!
        
        name = dictionary[ApiClient.JSONResponseKeys.RecommendFriendName] as! String
        header = dictionary[ApiClient.JSONResponseKeys.RecommendFriendHeader] as! String
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of Friend objects */
    static func friendsFromResults(results: [[String : AnyObject]]) -> [RecommendFriend] {
        var friends = [RecommendFriend]()
        
        for result in results {
            friends.append(RecommendFriend(dictionary: result))
        }
        
        return friends
    }
    
}
