//
//  VVValidator.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation

protocol ValidatorConvertableProtocol{
    func validated(_ value : String) throws
}

class Validator{
    var userInput : String
    var validatorType : ValidatorType
    
    init(input: String, validatorType: ValidatorType) {
        self.userInput = input
        self.validatorType = validatorType
    }
    
    func validatedText() throws {
        let factory = ValidatoryFactory.validate(with: validatorType)
        try factory.validated(self.userInput)
    }
}
