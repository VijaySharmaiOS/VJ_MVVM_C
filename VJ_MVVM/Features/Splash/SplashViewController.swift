//
//  SpViewController.swift
//  VJ_MVVM
//
//  Created by Vijay on 15/02/23.
//

import UIKit

class SplashViewController: ViewController<SplashViewModel> {

    @IBOutlet weak var createstunningImagelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func onClickLogintoAccount(_ sender: PrimaryButton) {
        viewModel.coordinator?.navToLoginAccount()
    }
    
    @IBAction func onClickCreateNewAccount(_ sender: Any) {
        viewModel.coordinator?.navToCreateAccount()
    }
    
}
