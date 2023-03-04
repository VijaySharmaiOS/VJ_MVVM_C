//
//  CreateAccountResponseModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 01/03/23.
//

import Foundation

struct CreateAccountResponseModel: Codable {

    let authToken: String?
    let crmRole: String?
    let discount: Int?
    let emailId: String?
    let enterpriseId: String?
    let message: String?
    let pricePerCredit: Int?
    let restaurantLocation: String?
    let restaurantName: String?
    let status: Int?
    let userId: String?
    let userName: String?
    let secretkey: String?


    enum CodingKeys: String, CodingKey {
        case authToken = "auth_token"
        case crmRole = "crm_role"
        case discount = "discount"
        case emailId = "email_id"
        case enterpriseId = "enterprise_id"
        case message = "message"
        case pricePerCredit = "price_per_credit"
        case restaurantLocation = "restaurant_location"
        case restaurantName = "restaurant_name"
        case status = "status"
        case userId = "user_id"
        case userName = "user_name"
        case secretkey = "secret_key"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        authToken = try values.decodeIfPresent(String.self, forKey: .authToken)
        crmRole = try values.decodeIfPresent(String.self, forKey: .crmRole)
        discount = try values.decodeIfPresent(Int.self, forKey: .discount)
        emailId = try values.decodeIfPresent(String.self, forKey: .emailId)
        enterpriseId = try values.decodeIfPresent(String.self, forKey: .enterpriseId)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        pricePerCredit = try values.decodeIfPresent(Int.self, forKey: .pricePerCredit)
        restaurantLocation = try values.decodeIfPresent(String.self, forKey: .restaurantLocation)
        restaurantName = try values.decodeIfPresent(String.self, forKey: .restaurantName)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        secretkey = try values.decodeIfPresent(String.self, forKey: .secretkey)
    }


}
