//
//  Double+AttributedString.swift
//  Altimeter
//
//  Created by Ilya Virnik on 23/05/2019.
//  Copyright © 2019 Ilya Virnik. All rights reserved.
//

import UIKit

extension Double {
    
    func celciusDarkAttributedString(fontSize: CGFloat) -> NSMutableAttributedString {
        let attributes = [NSAttributedString.Key.strokeColor: UIColor.white,
                          NSAttributedString.Key.foregroundColor: UIColor.ourDark,
                          NSAttributedString.Key.strokeWidth: -0.25,
                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .black)] as [NSAttributedString.Key : Any]
        return NSMutableAttributedString(string: String(format: "%.0f", self - 273.15),
                                         attributes: attributes)
    }
}
