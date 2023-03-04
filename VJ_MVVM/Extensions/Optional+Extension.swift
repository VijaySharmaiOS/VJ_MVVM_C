//
//  Optional+Extension.swift
//  VJ_MVVM
//
//  Created by Vijay on 22/02/23.
//

import Foundation

extension String?{
    var orEmpty : String{
        self ?? ""
    }
}

extension Int?{
        var orEmpty : Int{
        self ?? 0
    }
}
