//
//  AppDelegate.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Worked on by: Angus Kan, Marco Liang
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        return true
      }
    
    // set orientations you want to be allowed in this property by default
    var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
}

