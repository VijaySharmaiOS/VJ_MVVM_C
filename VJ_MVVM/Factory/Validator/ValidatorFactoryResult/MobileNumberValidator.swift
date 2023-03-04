//
//  MobileNumberValidator.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
class MobileNumberValidator: ValidatorConvertableProtocol {
    func validated(_ value: String) throws {
        guard value.count > 7 && value.count < 12 else {
            throw ValidationError("Please enter a valid Phone number")
        }
    }
}
