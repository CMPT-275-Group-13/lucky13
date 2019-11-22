//
//  ViewController.swift
//  PAPER Planes
//
//  Created by Angus Kan on 2019-10-31.
//  Worked on by: Angus Kan, Marco Liang, Kiel Henkelman
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import CoreMotion
import CoreGraphics

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var motionManager = CMMotionManager()
    @IBOutlet weak var topDistance: NSLayoutConstraint!
    @IBOutlet weak var leftDistance: NSLayoutConstraint!
    var currentXVelocity = CGFloat()
    var currentYVelocity = CGFloat()
    var currentX = CGFloat()
    var currentY = CGFloat()
    
    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.deviceMotionUpdateInterval = 0.01
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) {(data, error) in
            if let myData = data
            {
                
                self.currentXVelocity += CGFloat(myData.userAcceleration.x * 5)
                self.currentYVelocity -= CGFloat(myData.userAcceleration.y * 5)
                
                self.currentX += self.currentXVelocity
                self.currentY += self.currentYVelocity
                
                // velocity drift correction
                self.currentXVelocity += CGFloat(-self.currentX / 500)
                self.currentYVelocity += CGFloat(-self.currentY / 500)
                
                // positional drift correction
                self.currentX += CGFloat(-self.currentX / 50)
                self.currentY += CGFloat(-self.currentY / 50)
                
                self.leftDistance.constant = self.currentX + 70
                self.topDistance.constant = self.currentY + 100
            }
        }
    }
}
