//
//  NetworkRoute.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation
public protocol NetworkRoute {
    var baseURL: URL { get }
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

