//
//  UIColor+HEX.swift
//  Altimeter
//
//  Created by Ilya Virnik on 24/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1) {
        var cleanedHexString = hex
        if hex.hasPrefix("#") {
            cleanedHexString = String(hex.dropFirst())
        }
        var rgbValue: UInt32 = 0
        Scanner(string: cleanedHexString).scanHexInt32(&rgbValue)
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static let ourDark = UIColor(hex: "182126")
}
