//
//  ViewControllerTremorTest.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-17.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import AudioToolbox

class ViewControllerTremorTest: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Enter Tremor Test")
        //uploadTest()
        TremorTest.startAccelerometer()
        startCountdown()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
        TremorTest.stopTestAbrupt() // Stop the test timer so that we won't load the result view if the test is stopped abrubtly
        endCountdown()
    }
    
    var totalTime = 15
    var countdownTimer = Timer()
    
    @IBOutlet weak var testCountDownLabel: UILabel!
    func startCountdown() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        // countdownLabel.text = "Countdown: \(totalTime)"
        
        if totalTime != 0 {
            totalTime -= 1
            testCountDownLabel.text = "Countdown: \(totalTime)"
        } else {
            endCountdown()
        }
    }
    
    func endCountdown() {
        countdownTimer.invalidate()
        testCountDownLabel.text = "Countdown: 0"
        // TODO: display the test result and go back to the menu page
        TremorTest.stopAccelerometer()
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        uploadAcclerometerData()
    }
    
    lazy var TremorTest = TremorTestClass()
    
    let db = Firestore.firestore()
    
    func getSelfPatientData() {
        // TODO: For rev 3
    }
    
    func uploadDeviceMotionData() {
        var ref: DocumentReference? = nil
        getSelfPatientData()
        let (timestamp, pitchDatas, rollDatas, yawDatas) = TremorTest.getDeviceMotionResult()
        ref = db.collection("tests/csmith@gmail.com/tremor-test").addDocument(data: [
            "timeStamp": timestamp,
            "pitchData": pitchDatas,
            "rollData": rollDatas,
            "yawData": yawDatas
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func uploadAcclerometerData() {
        var ref: DocumentReference? = nil
        getSelfPatientData()
        let (timestamp, xAccel, yAccel, zAccel) = TremorTest.getAccelerometerData()
        
        ref = db.collection("tests/csmith@gmail.com/tremor-test").addDocument(data: [
            "timeStamp": timestamp,
            "xAccel": xAccel,
            "yAccel": yAccel,
            "zAccel": zAccel
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                self.uploadStatusLabel.text = "Upload Status: Uploaded to the doctors!"
                if let lastNumberX = xAccel.last {
                    self.xValueLabel.text = "X Value: \(lastNumberX)"
                }
                if let lastNumberY = yAccel.last {
                    self.yValueLabel.text = "Y Value: \(lastNumberY)"
                }
                if let lastNumberZ = zAccel.last {
                    self.zValueLabel.text = "Z Value: \(lastNumberZ)"
                }
            }
        }
    }
    
    @IBOutlet weak var uploadStatusLabel: UILabel!
    
    @IBOutlet weak var xValueLabel: UILabel!
    
    @IBOutlet weak var yValueLabel: UILabel!
    
    @IBOutlet weak var zValueLabel: UILabel!
}

