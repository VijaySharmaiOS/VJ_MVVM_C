//
//  CreateAccountRequestModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 01/03/23.
//

import Foundation

struct CreateAccountRequestModel : Encodable {
    var strategy : String
    var email_id : String
    var password : String
    var user_name : String
    var country : String
    var api_key : String
    var source : String
}



