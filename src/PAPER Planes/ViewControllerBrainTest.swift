//
//  ViewControllerBrainTest.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class ViewControllerBrainTest: UIViewController {
    // Don't allow auto rotate
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Make sure the test are run in Landscape mode
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
   
    var wrong_tap_count = 0
    
    
    @IBAction func WrongTap(_ sender: Any) {
        wrong_tap_count += 1
    }
    
}
