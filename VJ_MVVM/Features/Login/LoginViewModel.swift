//
//  LoginViewModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 21/02/23.
//

import Foundation

protocol LoginPresentProtocol : AnyObject{
    func didUserlogin(data : LoginResponse)
    func didUserFailtoLogin(message : String)
}

protocol LoginInteractorProtocol : ViewModelProtocol{
    func onTapLogin(email : String, Password : String)
}

typealias LoginViewModelProtocol = ViewModelProtocol & LoginInteractorProtocol

class LoginViewModel : LoginViewModelProtocol{
    
    var coordinator : LoginCoordinator?
    var loginDelegate :  LoginPresentProtocol?
    
    func onTapLogin(email: String, Password: String) {
        let loginCredential = LoginRequest(email: email, password: Password, api_key: "ee84dc3e-340e-4d39-a24c-9365272405f9",strategy: "PASSWORD")
//        let task = HTTPTask.requestWithParameters(bodyParameters: loginCredential, bodyEncoding: .urlEncoding, urlParameters: nil)
        
        let task = HTTPTask.requestParametersAndHeaders(bodyParameters: loginCredential, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["app_version_code": "4", "os": "ios", "Accept": "application/json", "Content-Type": "application/x-www-form-urlencoded; charset=utf-8", "app_version": "15.3.6", "type": "Self-Serve", "device_id": "27BCD0D0-62EA-4C30-846E-E5003A2593AE", "os_version": "14.7.1", "network_type": "WiFi", "model": "iPhone", "device_manufacturer": "iPhone"])
        let networkService = ServiceRouter()
        networkService.isLoggingEnable = true
        networkService.performDataTask(LoginRoute(task: task)) { (response: Result<LoginResponse, NetworkingError>) in
            switch response {
            case .success(let success):
                print(success)
                self.loginDelegate?.didUserlogin(data: success)
            case .failure(let failure):
                print(failure)
                self.loginDelegate?.didUserFailtoLogin(message: "")
            }
        }
    }
    
}
