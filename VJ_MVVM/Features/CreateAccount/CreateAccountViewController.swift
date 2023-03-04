//
//  CreateAccountViewController.swift
//  VJ_MVVM
//
//  Created by Vijay on 15/02/23.
//

import UIKit

class CreateAccountViewController: ViewController<CreateAccountViewModel> {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.createAccountDelegate = self
    }
    
    @IBAction func onClickCreateAccount(_ sender: PrimaryButton) {
//        let email = emailTF.text.orEmpty
//        let password = passwordTF.text.orEmpty
//        let confirmpassword =  confirmPasswordTF.text.orEmpty
//        viewModel.onCreateAccount(email: email, password: password, confirmPassword: confirmpassword)
        viewModel.onCreateAccount(email: "vijay@gmail.com", password: "123456", confirmPassword: "123456")
    }
    
    @IBAction func onClickAlreadyHaveAccount(_ sender: Any) {
        viewModel.coordinator?.navToLogin()
    }
}

extension CreateAccountViewController : CreateAccountPresenterProtocol{
    func didUserCreateAccount(with createAccountResponse: CreateAccountResponseModel) {
        viewModel.coordinator?.navToHome()
    }
    
    func didUserFailToCreateAccount(with message: String) {
        self.showBasicAlert(with: message)
    }
    
    
}
