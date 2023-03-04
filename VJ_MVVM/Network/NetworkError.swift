//
//  NetworkError.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation
protocol ErrorDescription {
    var errorMessage: String { get }
}
public enum NetworkingError: Error {
    case networkError
    case urlResponseError
    case decodingError
    case dataError
}


extension NetworkingError: ErrorDescription {
     public var errorMessage: String {
        switch self {
        case.decodingError:
            return "Error in decoding Response Data"
        case .dataError:
            return "Response data is empty"
        case .urlResponseError:
            return "Error in url response"
        case .networkError:
            return "Error in network connection"
        }
    }
}
