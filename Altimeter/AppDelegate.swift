//
//  AppDelegate.swift
//  Altimeter
//
//  Created by Ilya Virnik on 24/10/2018.
//  Copyright © 2018 Ilya Virnik. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        
        return true
    }
}

