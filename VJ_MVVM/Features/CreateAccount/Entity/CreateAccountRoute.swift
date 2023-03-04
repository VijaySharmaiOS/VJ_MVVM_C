//
//  CreateAccountRoute.swift
//  VJ_MVVM
//
//  Created by Vijay on 01/03/23.
//

import Foundation

struct CreateAccountRoute : NetworkRoute {
    var baseURL: URL {
        return URL(string: "https://www.clippr.ai")!
    }
    
    var path: String? {
        return "/api/v2/user/signup"
    }
    
    var httpMethod: HTTPMethod{
        return .post
    }
    
    var task: HTTPTask
    
    var headers: HTTPHeaders?
    
    
}
