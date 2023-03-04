//
//  CreateAccountCoordinator.swift
//  VJ_MVVM
//
//  Created by Vijay on 15/02/23.
//

import Foundation
import UIKit

protocol CreateAccountRouter {
    func navToHome()
    func navToLogin()
}

typealias CreateAccountRouterCoordinator = Coordinator & CreateAccountRouter

class CreateAccountCoordinator : CreateAccountRouterCoordinator{
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
   
    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewModel = CreateAccountViewModel()
        let vc = CreateAccountViewController(viewModel: viewModel)
        vc.viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navToHome() {
        let home = HomeCoordinator(navigationController: navigationController)
        home.configure()
    }
    
    func navToLogin() {
        let login = LoginCoordinator(navigationController: navigationController)
        login.configure()
    }
    
}
