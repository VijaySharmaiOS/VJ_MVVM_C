//
//  UIColor.swift
//  VJ_MVVM
//
//  Created by Vijay on 26/02/23.
//

import Foundation
import UIKit
extension UIColor {
    static let appColor = UIColor(hexString: "#58C18C")
}

extension UIColor {
    /// EZSE: init method with RGB values from 0 to 255, instead of 0 to 1. With alpha(default:1)
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }

    /// EZSE: init method with hex string and alpha(default: 1)
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {

        var formatted = hexString.replacingOccurrences(of: "0x", with: "")
        formatted = formatted.replacingOccurrences(of: "#", with: "")
        if let hex = Int(formatted, radix: 16) {
          let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16) / 255.0)
          let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8) / 255.0)
          let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0) / 255.0)
          self.init(red: red, green: green, blue: blue, alpha: alpha)        } else {
            return nil
        }
    }


    public convenience init?(hexAlpha: String) {

        let r, g, b, a: CGFloat

        var formatted = hexAlpha.replacingOccurrences(of: "0x", with: "")
        formatted = formatted.replacingOccurrences(of: "#", with: "")

        if formatted.count == 8 {
            let scanner = Scanner(string: formatted)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            } else {

                return nil
            }
        } else {

            if let hex = Int(formatted, radix: 16) {
                let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16) / 255.0)
                let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8) / 255.0)
                let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0) / 255.0)
                self.init(red: red, green: green, blue: blue, alpha: 1)

            } else {
                return nil
            }
        }
    }


    /// EZSE: init method from Gray value and alpha(default:1)
    public convenience init(gray: CGFloat, alpha: CGFloat = 1) {
        self.init(red: gray / 255, green: gray / 255, blue: gray / 255, alpha: alpha)
    }

    /// EZSE: Red component of UIColor (get-only)
    public var redComponent: Int {
        var r: CGFloat = 0
        getRed(&r, green: nil, blue: nil, alpha: nil)
        return Int(r * 255)
    }

    /// EZSE: Green component of UIColor (get-only)
    public var greenComponent: Int {
        var g: CGFloat = 0
        getRed(nil, green: &g, blue: nil, alpha: nil)
        return Int(g * 255)
    }

    /// EZSE: blue component of UIColor (get-only)
    public var blueComponent: Int {
        var b: CGFloat = 0
        getRed(nil, green: nil, blue: &b, alpha: nil)
        return Int(b * 255)
    }

    /// EZSE: Alpha of UIColor (get-only)
    public var alpha: CGFloat {
        var a: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &a)
        return a
    }

    
}
