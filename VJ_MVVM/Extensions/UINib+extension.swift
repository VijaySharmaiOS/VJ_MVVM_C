//
//  UINib+extension.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import Foundation
import UIKit
extension UICollectionView {
    func registerNIB(cellName name: String) {
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
}

extension UITableView {
    func registerNIB(cellName name: String) {
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
