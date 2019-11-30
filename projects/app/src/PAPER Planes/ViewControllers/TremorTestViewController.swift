//
//  TremorTestViewController.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-17.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase
import AudioToolbox

class TremorTestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    // Setting the tremor test timer
    var totalTime = 30
    // Initializing timer variable
    var countdownTimer = Timer()
    
    @IBOutlet weak var testCountDownLabel: UILabel!
    // Starting the test countdown
    func startCountdown() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    // Support function for startCountdown and endCountdown
    @objc func updateCountdown() {
        // countdownLabel.text = "Countdown: \(totalTime)"
        
        if totalTime != 0 {
            totalTime -= 1
            testCountDownLabel.text = "Hold your phone for: \(totalTime)"
        } else {
            endTestCountDown()
        }
    }
    
    // End the countdown
    func endCountdown() {
        countdownTimer.invalidate()
        testCountDownLabel.text = "Test Finished"
        TremorTest.stopAccelerometer()
    }
    
    // This function will be called when the test is finished
    // It will make the phone vibrate and upload the test data to firebase
    func endTestCountDown() {
        endCountdown()
        // Vibrating the phone when the test is done
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        uploadAcclerometerData()
    }
    
    // Initializing Tremor Test object
    // Initializing the model for the controller
    lazy var TremorTest = TremorTestClass()
    
    // Initializing Firestore variable
    let db = Firestore.firestore()
    // Getting the user's email to upload to the correct place
    func getSelfPatientData() -> String {
        return localUserEmail
    }
    
    // Uploading the data to firestore
    func uploadAcclerometerData() {
        var ref: DocumentReference? = nil
        let userEmail = getSelfPatientData()
        let (timestamp, xAccel, yAccel, zAccel) = TremorTest.getAccelerometerStdDev()
        
        // Uploading test data to Firestore
        ref = db.collection("tests/\(userEmail)/tremor-test").addDocument(data: [
            "timeStamp": timestamp,
            "xAccel": xAccel,
            "yAccel": yAccel,
            "zAccel": zAccel
        ]) { err in
            if let err = err {
                // If there're errors sending data to Firebase
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                self.uploadStatusLabel.text = "Upload Status: Uploaded to the doctors!"
                
                // Outputting the test results to the view
                self.xValueLabel.text = "X Value: \(xAccel)"
                self.yValueLabel.text = "Y Value: \(yAccel)"
                self.zValueLabel.text = "Z Value: \(zAccel)"
            }
        }
    }
    
    @IBOutlet weak var uploadStatusLabel: UILabel!
    @IBOutlet weak var xValueLabel: UILabel!
    @IBOutlet weak var yValueLabel: UILabel!
    @IBOutlet weak var zValueLabel: UILabel!
}

