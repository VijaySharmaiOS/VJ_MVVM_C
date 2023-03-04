//
//  URLParameterEnconder.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false){//, !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
//            for (key,value) in parameters {
//                let queryItem = URLQueryItem(name: key,
//                                             value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
//                urlComponents.queryItems?.append(queryItem)
//            }
            let mirror = Mirror(reflecting: parameters)
            
            for child in mirror.children {
                let queryItem = URLQueryItem(name: child.label ?? "",
                                             value: "\(child.value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        
    }
}
