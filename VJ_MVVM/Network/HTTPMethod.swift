//
//  HTTPMethod.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation

public enum HTTPMethod {
    case get
    case post
    case put
    case delete
}

extension HTTPMethod: RawRepresentable {
    public typealias RawValue = String
    public init?(rawValue: RawValue) {
        switch rawValue {
        case "G": self = .get
        case "P": self = .post
        case "PU": self = .put
        case "D": self = .delete
        default: return nil
        }
    }
    public var rawValue: RawValue {
        switch self {
        case .get: return "get"
        case .post: return "post"
        case .put: return "put"
        case .delete: return "delete"
        }
    }
}
