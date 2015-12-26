//
//  GhostAPI.swift
//  GhostAPI
//
//  Created by huchunbo on 15/12/27.
//  Copyright © 2015年 Bijiabo. All rights reserved.
//

import Foundation
import Alamofire

private let _GhostAPISharedInstance = GhostAPI()

public class GhostAPI {
    init() {}
    
    public var clientId: String = "ghost-frontend"
    public var clientSecret: String = "Undefined"
    
    public class var sharedInstance : GhostAPI {
        return _GhostAPISharedInstance
    }
    
}