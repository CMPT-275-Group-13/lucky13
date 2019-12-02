//
//  HomeViewController.swift
//  PAPER Planes
//
//  Created by Marco Liang on 2019-11-21.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import CoreMotion
import CoreGraphics

class HomeViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    @IBOutlet weak var stabilizerToggle: UIButton!

    @IBOutlet weak var topMargin: NSLayoutConstraint!
    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    @IBOutlet weak var rightMargin: NSLayoutConstraint!
    @IBOutlet weak var bottomMargin: NSLayoutConstraint!
    
    @IBOutlet weak var allRotation: UIStackView!
    
    var currentXVelocity = CGFloat()
    var currentYVelocity = CGFloat()
    var currentXRotationRate = CGFloat()
    var currentYRotationRate = CGFloat()
    var currentZRotationRate = CGFloat()
    var currentX = CGFloat()
    var currentY = CGFloat()
    var currentXRotation = CGFloat()
    var currentYRotation = CGFloat()
    var currentZRotation = CGFloat()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let db = Firestore.firestore()
        
    db.collection("patient").document(localUserEmail).getDocument{(document, error) in
        if let document = document, document.exists {
            let firstName = document.get("firstName") as! String
            let lastName = document.get("lastName") as! String
            localUserName = firstName + " " + lastName
            print(localUserName)
        } else {
            localUserName = "No patient profile found, contact your doctor"
        }
            
        self.nameLabel.text = localUserName
        
        self.stabilizerToggle.backgroundColor = UIColor.init(red: 0.76078431372, green: 0.86666666666, blue: 0.89411764705, alpha: 1)
        }
        

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.deviceMotionUpdateInterval = 0.01
        
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) {(data, error) in
            if let myData = data
            {
                if isStabilizing == true {
                    //print(myData)
                    //print("Values \(myData.userAcceleration.y * 500)")
                    
                    //self.animateButton() {
                    self.currentXVelocity += CGFloat(myData.userAcceleration.x * 5)
                    self.currentYVelocity -= CGFloat(myData.userAcceleration.y * 5)
                    self.currentXRotationRate += CGFloat(myData.rotationRate.x * 0.07)
                    self.currentYRotationRate += CGFloat(myData.rotationRate.y * 0.07)
                    self.currentZRotationRate += CGFloat(myData.rotationRate.z * 0.07)
                    
                    self.currentX += self.currentXVelocity
                    self.currentY += self.currentYVelocity
                    self.currentXRotation += self.currentXRotationRate
                    self.currentYRotation += self.currentYRotationRate
                    self.currentZRotation += self.currentZRotationRate
                    
                    // velocity drift correction
                    self.currentXVelocity += CGFloat(-self.currentX / 500)
                    self.currentYVelocity += CGFloat(-self.currentY / 500)
                    self.currentXRotationRate += CGFloat(-self.currentXRotationRate / 20)
                    self.currentYRotationRate += CGFloat(-self.currentYRotationRate / 20)
                    self.currentZRotationRate += CGFloat(-self.currentZRotationRate / 20)
                    
                    // positional drift correction
                    self.currentX += CGFloat(-self.currentX / 50)
                    self.currentY += CGFloat(-self.currentY / 50)
                    self.currentXRotation += CGFloat(-self.currentXRotation / 50)
                    self.currentYRotation += CGFloat(-self.currentYRotation / 50)
                    self.currentZRotation += CGFloat(-self.currentZRotation / 50)
                        
                    // screen limits correction
                    if self.currentX > 35 {
                        self.currentX = 35
                        self.currentXVelocity = 0
                    }
                    if self.currentX < -35 {
                        self.currentX = -35
                        self.currentXVelocity = 0
                    }
                    if self.currentY > 50 {
                        self.currentY = 50
                        self.currentYVelocity = 0
                    }
                    if self.currentY < -50 {
                        self.currentY = -50
                        self.currentYVelocity = 0
                    }
                    
                    // location update
                    self.leftMargin.constant = self.currentX + 35
                    self.topMargin.constant = self.currentY + 50
                    self.rightMargin.constant = -self.currentX + 35
                    self.bottomMargin.constant = -self.currentY + 50
                    
                    // rotation update
                    self.allRotation.transform = CGAffineTransform(a: pow(cos(self.currentYRotation * 0.01), -1),b:sin(self.currentZRotation * 0.01),c:-sin(self.currentZRotation * 0.01),d:pow(cos(self.currentXRotation * 0.01),-1),tx:0,ty:0)
                }
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppUtility.lockOrientation(.all)
    }
    
    @IBAction func stabilizerToggle(_ sender: Any) {
        if isStabilizing == true {
            isStabilizing = false
            
            self.stabilizerToggle.backgroundColor = UIColor.init(red: 0.76078431372, green: 0.86666666666, blue: 0.89411764705, alpha: 1)
            
            // reset location
            self.currentX = 0
            self.currentY = 0
            self.currentXVelocity = 0
            self.currentYVelocity = 0
            self.leftMargin.constant = self.currentX + 35
            self.topMargin.constant = self.currentY + 50
            self.rightMargin.constant = -self.currentX + 35
            self.bottomMargin.constant = -self.currentY + 50
            
            // reset rotation
            self.currentXRotation = 0
            self.currentYRotation = 0
            self.currentZRotation = 0
            self.currentXRotationRate = 0
            self.currentYRotationRate = 0
            self.currentZRotationRate = 0
            self.allRotation.transform = CGAffineTransform(a:1,b:0,c:0,d:1,tx:0,ty:0)
        }
        else if isStabilizing == false {
            isStabilizing = true
            
            self.stabilizerToggle.backgroundColor = UIColor.init(red: 0.4, green: 0.6, blue: 0.7, alpha: 1)
        }
    }
}


