//
//  GhostAPI.swift
//  GhostAPI
//
//  Created by huchunbo on 15/12/27.
//  Copyright © 2015年 Bijiabo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let _GhostAPISharedInstance = GhostAPI()

public class GhostAPI {
    init() {}
    // configuration
    public var clientId: String = "ghost-frontend"
    public var clientSecret: String = "Undefined"
    public var hostDomain: String = "yourdomain.com"
    public var hostProtocol: String = "http://"
    public var hostPort: Int = 80
    
    public var host: String {
        return "\(hostProtocol)\(hostDomain):\(hostPort)"
    }
    
    public var hostAPI: String {
        return "\(host)/ghost/api/v0.1/"
    }
    
    public class var sharedInstance : GhostAPI {
        return _GhostAPISharedInstance
    }
    
    /**
     Remote data fetch functions
     */
    
    public var tags: (completeHander: (error: ErrorType?, json: JSON)-> Void) -> Void {
        return request(path: "tags")
    }
    
    public var posts: (completeHander: (error: ErrorType?, json: JSON)-> Void) -> Void {
        return request(path: "posts")
    }
    
    public var users: (completeHander: (error: ErrorType?, json: JSON)-> Void) -> Void {
        return request(path: "users")
    }
    
    private func request(path path: String, var parameters: [String: String] = [String: String]()) -> ((error: ErrorType?, json: JSON)-> Void) -> Void {
        let url: String = "\(hostAPI)\(path)"
        parameters += [
            "client_id": clientId,
            "client_secret": clientSecret
        ]

        return { (completeHandler: (error: ErrorType?, json: JSON)-> Void) -> Void  in
            Alamofire
                .request(.GET, url, parameters: parameters)
                .responseSwiftyJSON({ (request, response, json, error) in
                    completeHandler(error: error, json: json)
                })
        }
        
    }
    
}

