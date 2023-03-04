//
//  LoginRequestModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation

struct LoginRequest:Encodable {
    var email: String
    var password: String
    var api_key : String
    var strategy : String
}
