//
//  LoginRoute.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation
struct LoginRoute : NetworkRoute{
    
    var baseURL: URL {
        return URL(string:"https://www.clippr.ai")!
    }
    
    var path: String? {
        "/api/v2/user/login"
    }
    
    var httpMethod: HTTPMethod{
        .post
    }
    
    var task: HTTPTask
    
    var headers: HTTPHeaders? 
    
    
}
