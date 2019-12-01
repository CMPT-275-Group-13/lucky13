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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Lock orientation to landscape
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
        TremorTest.stopTestAbrupt() // Stop the test timer so that we won't load the result view if the test is stopped abrubtly
        endCountdown()
    }
    
    
    @IBOutlet weak var testInstructionLabel: UILabel!
    
    // Start the tremor test by pressing the middle button
    var isTestBegan = false
    @IBAction func startButton(_ sender: UIButton) {
        if !isTestBegan {
            isTestBegan = true  // Set true to ignore button later
            TremorTest.startAccelerometer()
            startCountdown()
            // Displaying label for test progress
            testInstructionLabel.text = "Please hold your phone for 30 seconds"
            self.testInstructionLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2982127568)
            self.uploadStatusLabel.text = "Testing"
            self.uploadStatusLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2982127568)
            self.testCountDownLabel.text = "\(totalTime)"
            self.testCountDownLabel.font = UIFont(descriptor: testCountDownLabel.font.fontDescriptor, size: 30)
        } else {
            // Ignore other tap
        }
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
        
        if totalTime != 0 {
            totalTime -= 1
            testCountDownLabel.text = "\(totalTime)"
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
                self.uploadStatusLabel.text = "Tremor test done. Good job 😎"
            self.uploadStatusLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2982127568)
                
                // Outputting the test results to the view

            }
        }
    }
    
    @IBOutlet weak var uploadStatusLabel: UILabel!
}

