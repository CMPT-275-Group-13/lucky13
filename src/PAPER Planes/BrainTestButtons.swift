//
//  BrainTestButtons.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import Foundation

struct BrainTestButton {
    var isPressed = false
    var isFlashing = false
    var identifier: Int
    
    static var identificationFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identificationFactory += 1
        return identificationFactory
    }
    
    init() {
        self.identifier = BrainTestButton.getUniqueIdentifier()
    }
}
