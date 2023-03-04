//
//  CreateAccountViewModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 15/02/23.
//

import Foundation

protocol CreateAccountPresenterProtocol : AnyObject{
    func didUserCreateAccount(with createAccountResponse : CreateAccountResponseModel)
    func didUserFailToCreateAccount(with message : String)
}

protocol CreateAccountInteractorProtocol : ViewModelProtocol {
    func onCreateAccount(email: String, password : String , confirmPassword : String)
}

typealias CreateAccountViewModelProtocol = ViewModelProtocol & CreateAccountInteractorProtocol

final class CreateAccountViewModel : CreateAccountViewModelProtocol{
    
     var coordinator : CreateAccountCoordinator?
     var createAccountDelegate : CreateAccountPresenterProtocol?
    
    func onCreateAccount(email: String, password: String, confirmPassword: String) {
        let createAccountRequest = CreateAccountRequestModel(strategy: "PASSWORD", email_id: email, password: password, user_name: "Vijay", country: "India", api_key: "ee84dc3e-340e-4d39-a24c-9365272405f9", source: "ios")
        
        let task = HTTPTask.requestWithParameters(bodyParameters: createAccountRequest, bodyEncoding: .urlEncoding, urlParameters: nil)
        let networkService = ServiceRouter()
        networkService.performDataTask(CreateAccountRoute(task: task)) { (response: Result<CreateAccountResponseModel,NetworkingError>) in
            switch response {
            case .success(let success):
                print(success)
//                self.createAccountDelegate?.didUserCreateAccount(with: <#T##CreateAccountResponseModel#>)
            case .failure(let failure):
                print(failure)
                self.createAccountDelegate?.didUserFailToCreateAccount(with: "")
            }
        }
        
        
    }
    
}
