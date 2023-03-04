//
//  File.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation

protocol StringConstantDescription{
    var description: String {get}
}

enum StringConstants: StringConstantDescription{
    case appName
    case ok
    
    var description: String{
        switch self{
        case .appName:
            return "VJ-MVVM"
        case .ok:
            return "Ok"
        }
    }
}
