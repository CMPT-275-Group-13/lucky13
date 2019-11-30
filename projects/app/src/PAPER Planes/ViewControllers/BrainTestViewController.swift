//
//  BrainTestViewController.swift
//  PAPER Planes
//
//  Created by Quang Minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase

class BrainTestViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Lock orientation to landscape
        AppUtility.lockOrientation(.landscape)
        
        // Disabling swipe back for BRAIN test
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
        countdownTimer.invalidate() // Stop the test timer so that we won't load the result view if the test is stopped abrubtly
        // Enabling swipe back for future views
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var chosenHand = ""
    @IBOutlet var chooseHandLeft: UIButton!
    @IBOutlet var chooseHandRight: UIButton!
    @IBAction func chooseHand(_ sender: UIButton) {
        if !BrainTest.getGameState() {
            
            if sender == chooseHandLeft {
                chosenHand = "Left"
            } else {
                chosenHand = "Right"
            }
            BrainTest.startGame(hand: chosenHand)
            // Start the test countdown
            startCountdown()
            
            // Make the left right button disaapper
            chooseHandLeft.setTitle("", for: UIControl.State.normal)
            chooseHandRight.setTitle("", for: UIControl.State.normal)
            chooseHandLeft.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            chooseHandRight.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        } else {
            // Treat as very wrong tap
            BrainTest.reallyWrongButtonTapped()
        }
    }
    
    // Defining the model of the test
    lazy var BrainTest = BrainTestClass(handChosen: "Right", numberOfCorrectButtons: correctButtons.count)
    
    @IBOutlet var correctButtons: [UIButton]!
    // When the user taps down the correct button
    @IBAction func touchDownCorrectButtons(_ sender: UIButton) {
        if BrainTest.getGameState() {
            if let correctButtonNumber = correctButtons.index(of: sender) {
                BrainTest.correctButtonTappedIn(at: correctButtonNumber)
            }
        } else {
            // Ignore button touch down when the test hasn't started
            // I.e. the user haven't chosen their testing hand
        }
    }
    
    // When the user lifts up their finger from the correct button
    @IBAction func touchUpInsideCorrectButtons(_ sender: UIButton) {
        if let correctButtonNumber = correctButtons.index(of: sender) {
            BrainTest.correctButtonTappedOut(at: correctButtonNumber)
        } else {
            // Ignore button touch down when the test hasn't started
            // I.e. the user haven't chosen their testing hand
        }
    }
    
    // When the user taps on the buttons adjacent to the correct buttons
    // These buttons are transparent
    @IBAction func wrongTap(_ sender: UIButton) {
        if BrainTest.getGameState() {
            BrainTest.wrongButtonTapped()
        } else {
            // Ignore button touch down when the test hasn't started
            // I.e. the user haven't chosen their testing hand
        }
    }
    
    // When the user taps on anywhere else than the previous two types of buttons
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if BrainTest.getGameState() {
            BrainTest.reallyWrongButtonTapped()
        } else {
            // Ignore button touch down when the test hasn't started
            // I.e. the user haven't chosen their testing hand
        }
    }
    
    func getTestResultText() -> String {
        let (timestamp, handChosen, totalTaps, timeHeldAvg, timeBetweenAvg, accScore) = BrainTest.getResult()
        var testResultText = ""
        
        var tempText = "Date taken: \(timestamp)\n"
        testResultText.append(tempText)
        
        tempText = "Test on \(handChosen) Hand\n"
        testResultText.append(tempText)
        
        tempText = "Kinesia score: \(String(totalTaps))\n"
        testResultText.append(tempText)
        
        tempText = "Akinesia score: \(String(timeHeldAvg))\n"
        testResultText.append(tempText)
        
        tempText = "Incorrdination score: \(String(timeBetweenAvg))\n"
        testResultText.append(tempText)
        
        tempText = "Dysmetria score: \((String(accScore)))\n"
        testResultText.append(tempText)
        
        // Uploading the test data
        uploadBrainTestData()
        return testResultText
    }
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    // Countdown timer for tracking test time length
    var totalTime = 30
    var countdownTimer = Timer()
    
    // Start counting down the test time
    func startCountdown() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    // Supporting function for startCountdown
    @objc func updateCountdown() {
        countdownLabel.text = "Countdown: \(totalTime)"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endCountdown()
        }
    }
    
    func endCountdown() {
        countdownTimer.invalidate()
        // TODO: display the test result and go back to the menu page
        transitionToResult()
    }
    
    // Move the view to BRAIN test result view
    // Will be called when the countdown is 0
    func transitionToResult() {
        // Calling the segue that transfer to the result view
        performSegue(withIdentifier: "resultTransition", sender: self)
    }
    
    // Support function for transitionToResult
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultTransition" {
            let testResultText = getTestResultText()
            let vc = segue.destination as! BrainTestResultViewController
            vc.resultText = testResultText
        } else {
            return
        }
    }
    // Initializing Firestore variable
    let db = Firestore.firestore()
    
    // Getting user's email from their login
    func getSelfPatientData() -> String {
        return localUserEmail
    }
    
    func uploadBrainTestData() {
        var ref: DocumentReference? = nil
        // Getting the user's email for sending data to the right place
        let userEmail = getSelfPatientData()
        let (timestamp, handChosen, totalTaps, timeHeldAvg, timeBetweenAvg, accScore) = BrainTest.getResult()
        // Sending data to Firebase
        ref = db.collection("tests/\(userEmail)/brain-test").addDocument(data: [
            "timeStamp": timestamp,
            "chosenHand": handChosen,
            "KinesiaScore": totalTaps,
            "AkinesiaScore": timeHeldAvg,
            "IncorrdinationScore": timeBetweenAvg,
            "DysmetriaScore": accScore
        ]) { err in
            if let err = err {
                // If there're errors sending data to Firebase
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
