//
//  SkuViewModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 01/03/23.
//

import Foundation

protocol skuPresenterProtocol : AnyObject{
    func didGetAllSku()
    func didFailToGetSku()
}

protocol skuInteractorProtocol : ViewModelProtocol{
    func onClickBack()
}

typealias SkuInteractorViewModel = skuInteractorProtocol & ViewModelProtocol

class SkuViewModel : SkuInteractorViewModel{
    
    var coordinator : SkuCoordinator?
    var skuDelegate : skuPresenterProtocol?
    
    func onClickBack() {
        coordinator?.navToBack()
    }
    
}
