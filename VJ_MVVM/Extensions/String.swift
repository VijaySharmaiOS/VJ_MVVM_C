//
//  String.swift
//  VJ_MVVM
//
//  Created by Vijay on 13/02/23.
//

import Foundation
import UIKit
extension String {
    
    func returnAttributedStringWithPurpleText(range: [NSRange]) -> NSAttributedString {
        let regularAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let colorAttribute = [NSAttributedString.Key.foregroundColor :UIColor.purple]
        let attributedSentence = NSMutableAttributedString(string: self, attributes: regularAttribute)
        for range in range {
            attributedSentence.setAttributes(colorAttribute, range: range)
        }
        return attributedSentence

    }
}
