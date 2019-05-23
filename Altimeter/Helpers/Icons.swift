//
//  Icons.swift
//  Altimeter
//
//  Created by Ilya Virnik on 29/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import UIKit

enum Icons {
    
    static let iconsSet: [String: UIImage?] = ["ClearDay": UIImage(named: "ClearDay.png"),
                                               "CloudsDay": UIImage(named: "CloudsDay.png"),
                                               "AtmosphereDay": UIImage(named: "CloudsDay.png"),
                                               "RainDay": UIImage(named: "RainDay.png"),
                                               "DrizzleDay": UIImage(named: "RainDay.png"),
                                               "ThunderstormDay": UIImage(named: "StormDay.png"),
                                               "SnowDay": UIImage(named: "SnowDayNight.png"),
                                               "ClearNight": UIImage(named: "ClearNight.png"),
                                               "CloudsNight": UIImage(named: "CloudsNight.png"),
                                               "AtmosphereNight": UIImage(named: "CloudsNight.png"),
                                               "RainNight": UIImage(named: "RainStormNight.png"),
                                               "DrizzleNight": UIImage(named: "RainStormNight.png"),
                                               "ThunderstormNight": UIImage(named: "RainStormNight.png"),
                                               "SnowNight": UIImage(named: "SnowDayNight.png")]
}
