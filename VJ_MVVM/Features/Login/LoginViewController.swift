//
//  LoginViewController.swift
//  VJ_MVVM
//
//  Created by Vijay on 21/02/23.
//

import UIKit

class LoginViewController: ViewController<LoginViewModel> {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loginDelegate = self
    }
    
    @IBAction func onClickLogin(_ sender: PrimaryButton) {
//        viewModel.coordinator?.navToHome()
        let email = emailTF.text.orEmpty
        let password = passwordTF.text.orEmpty
        viewModel.onTapLogin(email: "sahil.rupani@spyne.ai", Password: "12345678")
    }
    
    @IBAction func onClickCreateAccount(_ sender: Any) {
        viewModel.coordinator?.navToCreateAccount()
    }
    
}

extension LoginViewController : LoginPresentProtocol{
    func didUserlogin(data: LoginResponse) {
        DispatchQueue.main.async {
            self.viewModel.coordinator?.navToHome()
        }
    }

    
    func didUserFailtoLogin(message: String) {
        DispatchQueue.main.async {
            self.showBasicAlert(with: message)
        }
    }
 
}
