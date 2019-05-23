//
//  Day.swift
//  Altimeter
//
//  Created by Ilya Virnik on 29/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import Foundation

enum Day {
    
    enum DayTime: String { case day, night }
    
    static var time: DayTime {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 7 && hour <= 20 {
            return .day
        } else {
            return .night
        }
    }
}
