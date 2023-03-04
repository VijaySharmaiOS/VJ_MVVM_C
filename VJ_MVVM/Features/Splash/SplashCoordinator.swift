//
//  SplashCoordinator.swift
//  VJ_MVVM
//
//  Created by Vijay on 15/02/23.
//

import Foundation
import UIKit

protocol SplashRouter {
    func navToCreateAccount()
    func navToLoginAccount()
}

typealias SplashRouterCoordinator = Coordinator & SplashRouter

class SplashCoordinator : SplashRouterCoordinator{
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewModel = SplashViewModel()
        let vc = SplashViewController(viewModel: viewModel)
        vc.viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navToCreateAccount() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        child.configure()
    }
    
    func navToLoginAccount() {
        let child = LoginCoordinator(navigationController: navigationController)
        child.configure()
    }
    
    
    
}
