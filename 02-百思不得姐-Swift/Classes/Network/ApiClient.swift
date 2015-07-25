//
//  ApiClient.swift
//  02-百思不得姐-Swift
//
//  Created by 杨志超 on 15/7/23.
//  Copyright (c) 2015年 justwe. All rights reserved.
//

import UIKit

class ApiClient {
    
    // 单例
    static let sharedInstance = ApiClient()
    
    var session: NSURLSession
    
    private init () {
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 30
        
        session = NSURLSession(configuration: configuration)
    }
    
    func taskForGETMethod(method: String, parameters: [String: AnyObject],
        completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
            
        var mutableParameters = parameters
            
        let urlString = Constants.BaseURL + method + ApiClient.escapedParameters(mutableParameters)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
            
        let task = session.dataTaskWithRequest(request) { data, response, error in
            
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                ApiClient.parseJSONWithCompletionHandler(data, completionHandler: completionHandler)
            }
        }
            
        task.resume()
            
        return task
    }
    
    func taskForPOSTMethod(method: String, parameters: [String: AnyObject], completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        var mutableParameters = parameters
        
        let urlString = Constants.BaseURL + method;
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)
        var jsonifyError: NSError? = nil
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters, options: nil, error: &jsonifyError)
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
            if let error = error {
                println(error)
                completionHandler(result: nil, error: error)
            } else {
                ApiClient.parseJSONWithCompletionHandler(data, completionHandler: completionHandler)
            }
        })
        
        task.resume()
        
        return task
    }
    
    // MARK: - Helpers
    
    /* Helper: Given raw JSON, return a usable Foundation object */
    class func parseJSONWithCompletionHandler(data: NSData, completionHandler: (result: AnyObject!, error: NSError?) -> Void) {
        
        var parsingError: NSError? = nil
        
        let parsedResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parsingError)
        
        if let error = parsingError {
            completionHandler(result: nil, error: error)
        } else {
            completionHandler(result: parsedResult, error: nil)
        }
    }
    
    /* Helper function: Given a dictionary of parameters, convert to a string for a url */
    class func escapedParameters(parameters: [String : AnyObject]) -> String {
        
        var urlVars = [String]()
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
            
        }
        
        return (!urlVars.isEmpty ? "?" : "") + join("&", urlVars)
    }
    
}
