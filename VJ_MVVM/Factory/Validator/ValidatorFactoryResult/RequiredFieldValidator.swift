//
//  RequiredFieldValidator.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
class RequiredFieldValidator: ValidatorConvertableProtocol {
    
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    func validated(_ value: String) throws {
        guard !value.isEmpty else {
            throw ValidationError("Required field " + fieldName)
        }
    }
}
