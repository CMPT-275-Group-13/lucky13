//
//  BrainTestCorrectButton.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-15.
//  Copyright © 2019 Quang minh Dinh. All rights reserved.
//

import Foundation


class BrainTestCorrectButton {
    
    // Flags for correct button logic
    // if the user's finger is on one correct button, disable the other one and start the timeHeld timer (isTappedIn = true)
    // by disabling the other button, there shouldn't be a case where the user taps and hold two buttons at a same time
    // if the user taps out of the current correct button, enable the other correct button, start the timeBetween timer and switch isTapped true
    // If the user taps on a correct button whose isTapped = true, counts as a wrong tap
    var isTappedIn = false
    var isTapped = false
    //var identifier: Int
    
    static var identifierFactory = 0    // For identifying button 1 and button 2
    static func getUniqueIdentifier() -> Int {
        BrainTestCorrectButton.identifierFactory += 1
        return BrainTestCorrectButton.identifierFactory
    }
}
