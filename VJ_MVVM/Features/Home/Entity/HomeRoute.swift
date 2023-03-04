//
//  HomeRoute.swift
//  VJ_MVVM
//
//  Created by Vijay on 03/03/23.
//

import Foundation
struct HomeRoute : NetworkRoute {
    var baseURL: URL {
        return URL(string: "https://www.clippr.ai")!
    }
    
    var path: String? {
        return "/api/nv1/category-agnostic/get-category-data"
    }
    
    var httpMethod: HTTPMethod{
        return .get
    }
    
    var task: HTTPTask
    
    var headers: HTTPHeaders?
    
    
}
