//
//  MyProjectCoordinator.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import Foundation
import UIKit

protocol MyProjectRouter {
    func navToBack()
    func navToSkuScreen()
}

typealias MyProjectRouterCoordinator = MyProjectRouter & Coordinator

class MyProjectCoordinator : MyProjectRouterCoordinator{
    
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navToBack() {
        navigationController.popViewController(animated: true)
    }
    
    func configure() {
        let viewmodel = MyProjectViewModel()
        let vc = MyProjectsViewController(viewModel: viewmodel)
        vc.viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: true)
       
    }
    
    func navToSkuScreen() {
        let sku = SkuCoordinator(navigationController: navigationController)
        sku.configure()
    }
    
}
