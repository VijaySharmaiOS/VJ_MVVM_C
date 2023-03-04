//
//  UINib+SingleViewLoad.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import Foundation
import UIKit

fileprivate extension UINib {
    
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}

extension UINib {
    
    class func openWalletView(_ owner: AnyObject) -> UIView {
        return loadSingleView("WalletView", owner: owner)
    }
    
}
