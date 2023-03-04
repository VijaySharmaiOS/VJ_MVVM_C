//
//  EmailValidator.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
class EmailValidator: ValidatorConvertableProtocol {
    
    private (set) var emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    func validated(_ value: String) throws {
        do {
            if try NSRegularExpression(pattern:emailPattern, options: .caseInsensitive)
                .firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Please enter a valid email address")
            }
        } catch {
            throw ValidationError("Please enter a valid email address")
        }
    }
}
