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
    
    public func tags(completeHandler completeHandler: (error: ErrorType?, json: JSON)-> Void) {
        let url: String = "\(hostAPI)tags"
        let parameters: [String: String] = [
            "client_id": clientId,
            "client_secret": clientSecret
        ]
        
        Alamofire.request(.GET, url, parameters: parameters)
            .responseSwiftyJSON({ (request, response, json, error) in
                completeHandler(error: error, json: json)
            })
    }
    
    public func posts(completeHandler completeHandler: (error: ErrorType?, json: JSON)-> Void) {
        let url: String = "\(hostAPI)posts"
        let parameters: [String: String] = [
            "client_id": clientId,
            "client_secret": clientSecret
        ]
        
        Alamofire.request(.GET, url, parameters: parameters)
            .responseSwiftyJSON({ (request, response, json, error) in
                completeHandler(error: error, json: json)
            })
    }
    
}