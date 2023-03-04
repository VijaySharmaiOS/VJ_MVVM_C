//
//  MyProjectViewModel.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import Foundation

protocol MyprojectPresenterProtocol : AnyObject{
    func didgetMyProjectsData(message : String)
    func didFailtogetMyprojectData(message : String)
}

protocol MyprojectInteractorProtocol : ViewModelProtocol{
    func onClickBack()
}

typealias MyProjectInteractorViewModel = ViewModelProtocol & MyprojectInteractorProtocol


class MyProjectViewModel : MyProjectInteractorViewModel{
    
    var coordinator : MyProjectCoordinator?
    var myprojectDelegate : MyprojectPresenterProtocol?
    
    func onClickBack() {
        coordinator?.navToBack()
    }
}
