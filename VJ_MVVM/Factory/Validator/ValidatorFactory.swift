//
//  ValidatorFactory.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation

enum ValidatoryFactory{
    
    static func validate(with _type: ValidatorType) -> ValidatorConvertableProtocol{
        
        switch _type{
        case .email:
            return EmailValidator()
        case .password:
            return PasswordValidator()
        case .username:
            return UserNameValidator()
        case .mobile:
            return MobileNumberValidator()
        case .requiredField(field: let field):
            return RequiredFieldValidator(field)
        case .matchField(fieldName: let fieldName, secoundField: let secoundField):
            return MatchFieldValidator(fieldName, secoundField)
        }
        
    }
}
