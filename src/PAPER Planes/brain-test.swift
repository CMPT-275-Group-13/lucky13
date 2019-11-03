//
//  brain-test.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import Foundation

class BrainTest {
    
    var numberCorrectTaps = 0
    var numberWrongTaps = 0
    
    var avgTimeOnButton = 0.0
    var timeOnButton = 0.0
    
    var timeVarBetweenTaps = 0.0
    
    var tapsAccuracy = 0.0
    let dataTaken = Date()
    
    var correctButtons = [BrainTestButton]()
    //var wrongButtonsLeft = [BrainTestWrongButton]()
    
    func tapDownButton (at index: Int) {
        // When the user taps down the button
        // Start the timer, increment time_held
    }
    
    func tapUpButton (at index: Int) {
        numberCorrectTaps += 1
    }
    
    /*func startTest() {
        // Set up the test
    }*/
    
    
    func outputTestData() {
        // Output test data to terminal
        
    }
    
    func takeTimeOnButton (at index: Int) {
        // take the time on button time from the controller
        
    }
    
    init(numberOfCorrectButtons: Int) {
        for _ in 1...numberOfCorrectButtons {
            // Initializing buttons
            let testButton = BrainTestButton()
            correctButtons.append(testButton)
        }
        // Initializing result placeholders
        
    }
}
