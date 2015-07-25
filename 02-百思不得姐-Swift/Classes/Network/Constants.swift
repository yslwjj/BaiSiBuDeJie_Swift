//
//  Constants.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/23.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import Foundation

extension ApiClient {
    
    // MARK: - Constants
    struct Constants {
        
        // URLs
        static let BaseURL : String = "http://api.budejie.com/api/api_open.php"
        static let BaseURLSecure : String = "https://api.budejie.com/api/api_open.php"
        
    }
    
    // MARK: - Parameter Keys
    struct ParameterKeys {
        
        // RecommendChannels
        static let FirstParam = "a"
        static let SecondParam = "c"
        
        // RecommendFriends
        static let CategoryId = "category_id"
        static let Page = "page"
        
        // RecommendTags
        static let Action = "action"
        
        
    }
    
    // MARK: - Parameter Values
    struct ParameterValues {
        
        // RecommendChannels
        static let Category = "category"
        static let Subscribe = "subscribe"
        
        // RecommendFriends
        static let List = "list"
        
        // SubscribeTags
        static let TagList = "tags_list"
        
        // RecommendTags
        static let TagRecommend = "tag_recommend"
        static let Action = "sub"
        static let Topic = "topic"
        
    }
    
    // MARK: - JSON Response Keys
    struct JSONResponseKeys {
        
        // “推荐关注”中左侧标签的列表
        static let RecommendChannelTotal = "total"   // 左侧标签总数
        static let RecommendChannelList = "list"     // 标签数组
        static let RecommendChannelName = "name"     // 标签名称
        static let RecommendChannelCount = "count"   // 此标签下的用户数
        static let RecommendChannelId = "id"         // 标签id
        
        // “推荐关注”中左侧标签每个标签对应的推荐用户组
        static let RecommendFriendHeader = "header"         // 所推荐用户的被关注量
        static let RecommendFirendFansCount = "fans_count"  // 所推荐的用户昵称
        static let RecommendFriendName = "screen_name"      // 所推荐的用户的头像url
        static let RecommendFriendTotoal = "total"          // 一共加载了多少个推荐用户
        
        // “标签订阅”页面中所有标签的信息
        static let SubscribeTags = "def_tags"           // 已经订阅的标签数组
        static let RecommendationTags = "rec_tags"      // 推荐订阅的标签数组
        
        static let TagImage = "image_list"              // 标签图片的url地址
        static let TagName = "theme_name"               // 标签的名字
        static let TagSubscribeNumber = "sub_number"    // 订阅数量

        
    }
}