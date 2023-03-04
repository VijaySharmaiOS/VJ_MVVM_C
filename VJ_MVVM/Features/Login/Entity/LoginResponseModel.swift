//
//  LoginResponseModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 27/02/23.
//

import Foundation

struct LoginResponse : Codable {

    let authToken : String?
    let emailId : String?
    let message : String?
    let status : Int?
    let userId : String?
    let userName : String?
    let checkQC : Bool?
    
    enum CodingKeys: String, CodingKey {
        case authToken = "auth_token"
        case emailId = "email_id"
        case message = "message"
        case status = "status"
        case userId = "user_id"
        case userName = "user_name"
        case checkQC = "check_qc"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        authToken = try values.decodeIfPresent(String.self, forKey: .authToken)
        emailId = try values.decodeIfPresent(String.self, forKey: .emailId)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        checkQC = try values.decodeIfPresent(Bool.self, forKey: .checkQC)
    }


}
