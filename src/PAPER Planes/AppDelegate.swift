//
//  AppDelegate.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
      }

}

