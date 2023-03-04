//
//  WalletView.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import UIKit

class WalletView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerNib()
    }

    
    func registerNib() {
        
        Bundle.main.loadNibNamed("", owner: self)
    }
}
