//
//  brain-test.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import Foundation

class BrainTest {
    
    var number_key_taps = 0
    var time_held = 0.0
    var time_var_between = 0.0
    var taps_acc = 0.0
    let date_taken = Date()
    
    var buttons = [BrainTestButton]()
    
    func tapButton (at index: Int) {
        
    }
    
    func startTest() {
        
    }
    
    func countDownOneMinute() {
        
    }
    
    func outputTestData() {
        
    }
    
    init() {
        for _ in 1...2 {
            // Initializing buttons
            let testButton = BrainTestButton()
            buttons.append(testButton)
        }
        // Initializing result placeholders
        
    }
}
