//
//  ApiClientConvenience.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/23.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import Foundation

extension ApiClient {
    
    func getRecommendChannels(completionHandler: (result: [RecommendChannel]?, error: NSError?) -> Void) {
        
        let parameters = [ParameterKeys.FirstParam: ParameterValues.Category,
            ParameterKeys.SecondParam: ParameterValues.Subscribe]
        
        taskForGETMethod("", parameters: parameters) { JSONResult, error in
            
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                if let results = JSONResult[JSONResponseKeys.RecommendChannelList] as? [[String: AnyObject]] {
                    
                    let channels = RecommendChannel.channelsFromResults(results)
                    completionHandler(result: channels, error: nil)
                    
                } else {
                    completionHandler(result: nil, error: NSError(domain: "getRecommendChannels parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getRecommendChannels"]))
                }
            }
            
        }
        
    }
    
    func getRecommendFriends(categoryId: String, page: Int = 1, completionHandler: (total: Int?, result: [RecommendFriend]?, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        let parameters = [ParameterKeys.FirstParam: ParameterValues.List,
            ParameterKeys.SecondParam: ParameterValues.Subscribe,
            ParameterKeys.CategoryId: categoryId,
            ParameterKeys.Page: "\(page)"]
        
        return taskForGETMethod("", parameters: parameters) { JSONResult, error in
            
            if let error = error {
                completionHandler(total: nil, result: nil, error: error)
            } else {
                if let results = JSONResult[JSONResponseKeys.RecommendChannelList] as? [[String: AnyObject]],
                let total = JSONResult[JSONResponseKeys.RecommendChannelTotal] as? Int {
                    
                    let friends = RecommendFriend.friendsFromResults(results)
                    
                    completionHandler(total: total, result: friends, error: nil)
                    
                } else {
                    
                    completionHandler(total: nil, result: nil, error: NSError(domain: "getRecommendFriends parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getRecommendFriends"]))
                    
                }
            }
        }
    }
    
    func getSubscribeTags(completionHandler: (defTags: [SubscribeTag]?, recTags: [SubscribeTag]?, error: NSError?) -> Void) {
        
        let parameters = [ParameterKeys.FirstParam: ParameterValues.TagList,
            ParameterKeys.SecondParam: ParameterValues.Subscribe]
        
        taskForGETMethod("", parameters: parameters) { JSONResult, error in
            
            if let error = error {
                completionHandler(defTags: nil, recTags: nil, error: error)
            } else {
                
                if let defResults = JSONResult[JSONResponseKeys.SubscribeTags] as? [[String: AnyObject]],
                let recResults = JSONResult[JSONResponseKeys.RecommendationTags] as? [[String: AnyObject]] {
                    
                    let defTags = SubscribeTag.tagsFromResults(defResults)
                    let recTags = SubscribeTag.tagsFromResults(recResults)
                    
                    completionHandler(defTags: defTags, recTags: recTags, error: nil)
                    
                } else {
                    
                    completionHandler(defTags: nil, recTags: nil, error: NSError(domain: "getRecommendTags parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getRecommendTags"]))
                }
            }
        }
    }
    
    func getRecommnedTags(completionHandler: (result: [SubscribeTag]?, error: NSError?) -> Void) {
        
        let parameters = [ParameterKeys.FirstParam: ParameterValues.TagRecommend,
            ParameterKeys.SecondParam: ParameterValues.Topic,
            ParameterKeys.Action: ParameterValues.Action]
        
        taskForGETMethod("", parameters: parameters) { JSONResult, error in
            
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                
                if let results = JSONResult as? [[String: AnyObject]]{
                    
                    let tags = SubscribeTag.tagsFromResults(results)
                    completionHandler(result: tags, error: nil)
                    
                } else {
                    
                    completionHandler(result: nil, error: NSError(domain: "getRecommendTags parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getRecommendTags"]))
                    
                }
                
            }
            
        }
        
    }
}