//
//  LoginCoordinator.swift
//  VJ_MVVM
//
//  Created by Vijay on 21/02/23.
//

import Foundation
import UIKit

protocol LoginRouter {
    func navToCreateAccount()
    func navToHome()
}

typealias LoginRouterCoordinator = Coordinator & LoginRouter

class LoginCoordinator :  LoginRouterCoordinator {
    
    weak var parentcoordinator : SplashCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController)
    {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewModel = LoginViewModel()
        let vc = LoginViewController(viewModel: viewModel)
        vc.viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navToCreateAccount() {
         let createAccount = CreateAccountCoordinator(navigationController: navigationController)
         createAccount.configure()
    }
    
    func navToHome() {
        let home = HomeCoordinator(navigationController: navigationController)
        home.configure()
    }
    
    
}
