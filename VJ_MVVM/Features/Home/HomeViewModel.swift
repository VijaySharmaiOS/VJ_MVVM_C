//
//  HomeViewModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 23/02/23.
//

import Foundation

protocol HomePresenterProtocol : AnyObject{
    func didgetHomeData()
    func didFailTogetHomeData()
}

protocol HomeIntrectorProtocol : ViewModelProtocol{
    func onClickWallet()
    func onClickSelectCatgeory()
    func onClickViewAll()
}

typealias HomeViewModelProtocol = ViewModelProtocol & HomeIntrectorProtocol

class HomeViewModel : HomeViewModelProtocol{
    
     var coordinator : HomeCoordinator?
     var homedelegate : HomePresenterProtocol?
    
    
    func onClickWallet() {
        
    }
    
    func onClickSelectCatgeory() {
        coordinator?.navToMyProjectScreen()
    }
    
    func onClickViewAll() {
        coordinator?.navToMyProjectScreen()
    }
    
}
