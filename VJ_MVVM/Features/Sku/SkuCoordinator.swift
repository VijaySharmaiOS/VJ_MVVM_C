//
//  SkuCoordinator.swift
//  VJ_MVVM
//
//  Created by Vijay on 01/03/23.
//

import Foundation
import UIKit

protocol skuRouter {
    func navToBack()
}

typealias skuRouterCoordinator = skuRouter & Coordinator

class SkuCoordinator : skuRouterCoordinator{
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewmodel = SkuViewModel()
        let vc = SkuViewController(viewModel: viewmodel)
        vc.viewModel.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navToBack() {
        self.navigationController.popViewController(animated: true)
    }
    
    
}
