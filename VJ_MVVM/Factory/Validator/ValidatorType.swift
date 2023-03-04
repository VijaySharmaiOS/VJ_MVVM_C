//
//  VValidatorType.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
enum ValidatorType {
    case email
    case password
    case username
    case mobile
    case requiredField(field: String)
    case matchField(fieldName: String, secoundField: String)
}
