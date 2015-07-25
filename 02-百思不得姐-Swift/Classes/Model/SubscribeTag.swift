//
//  SubscribeTag.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/25.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import Foundation

class SubscribeTag {
    var name: String
    var imagePath: String
    var subscribeNumber: Int
    
    required init(dictionary: [String: AnyObject]) {
        name = dictionary[ApiClient.JSONResponseKeys.TagName] as! String
        imagePath = dictionary[ApiClient.JSONResponseKeys.TagImage] as! String
        
        let subNumStr = dictionary[ApiClient.JSONResponseKeys.TagSubscribeNumber] as! String
        subscribeNumber = subNumStr.toInt()!
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of Friend objects */
    static func tagsFromResults(results: [[String : AnyObject]]) -> [SubscribeTag] {
        var tags = [SubscribeTag]()
        
        for result in results {
            tags.append(SubscribeTag(dictionary: result))
        }
        
        return tags
    }
}
