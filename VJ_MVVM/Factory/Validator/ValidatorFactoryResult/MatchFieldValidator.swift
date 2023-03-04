//
//  MatchFieldValidator.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
class MatchFieldValidator: ValidatorConvertableProtocol {
    private let fieldName : String
    private let secoundField : String

    init(_ fieldName: String, _ secoundField: String){
        self.fieldName = fieldName
        self.secoundField = secoundField
    }
    func validated(_ value: String) throws {
        
        guard (value == secoundField) else{
            throw ValidationError(fieldName + " does not match")
        }
        
    }
}
