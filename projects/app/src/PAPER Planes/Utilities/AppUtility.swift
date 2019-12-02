//
//  AppUtility.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-17.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import Foundation
import UIKit

struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    // OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
    
}
