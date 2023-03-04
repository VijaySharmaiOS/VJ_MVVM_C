//
//  HomeViewCoordinator.swift
//  VJ_MVVM
//
//  Created by Vijay on 23/02/23.
//

import Foundation
import UIKit

protocol HomeRouter {
    func navToClickWallet()
    func navToClickCategorySelect()
    func navToMyProjectScreen()
    func navToskuScreen()
}

typealias HomeRoterCoordinator = Coordinator & HomeRouter

class HomeCoordinator :  HomeRoterCoordinator{
   
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func configure() {
        let viewModel = HomeViewModel()
        let home = HomeViewController(viewModel: viewModel)
        viewModel.coordinator = self
        self.navigationController.pushViewController(home, animated: true)
    }
    
    func navToClickWallet() {
        
    }
    
    func navToClickCategorySelect() {
        
    }
    
    func navToMyProjectScreen() {
        let myproject =  MyProjectCoordinator(navigationController: navigationController)
        myproject.configure()
    }
    
    func navToskuScreen() {
        let sku =  SkuCoordinator(navigationController: navigationController)
        sku.configure()
    }
    
    
}
