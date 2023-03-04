//
//  UserNameValidator.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation

class UserNameValidator: ValidatorConvertableProtocol {
    func validated(_ value: String) throws {
        guard value.count > 4 && value.count < 12 else {
            throw ValidationError("User name is invalid")
        }
    }
}
