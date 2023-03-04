//
//  File.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
class ValidationError: Error {
    
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}
