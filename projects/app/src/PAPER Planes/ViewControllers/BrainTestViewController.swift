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
        
        AppUtility.lockOrientation(.landscape)
        // Or to rotate and lock
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeLeft)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
        countdownTimer.invalidate() // Stop the test timer so that we won't load the result view if the test is stopped abrubtly
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
            // Ignore button touch down
        }
        
    }
    
    // When the user lifts up their finger from the correct button
    @IBAction func touchUpInsideCorrectButtons(_ sender: UIButton) {
        if let correctButtonNumber = correctButtons.index(of: sender) {
            BrainTest.correctButtonTappedOut(at: correctButtonNumber)
        }
    }
    
    // When the user taps on the buttons adjacent to the correct buttons
    // These buttons are transparent
    @IBAction func wrongTap(_ sender: UIButton) {
        if BrainTest.getGameState() {
            BrainTest.wrongButtonTapped()
        }
    }
    
    // When the user taps on anywhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if BrainTest.getGameState() {
            BrainTest.reallyWrongButtonTapped()
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
        
        print(testResultText)
        // Uploading the test data
        uploadBrainTestData()
        return testResultText
    }
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    // Countdown timer for tracking test time length
    var totalTime = 30
    var countdownTimer = Timer()
    
    func startCountdown() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
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
    
    let db = Firestore.firestore()
    
    func getSelfPatientData() -> String {
        return localUserEmail
    }
    
    func uploadBrainTestData() {
        var ref: DocumentReference? = nil
        let userEmail = getSelfPatientData()
        let (timestamp, handChosen, totalTaps, timeHeldAvg, timeBetweenAvg, accScore) = BrainTest.getResult()
        ref = db.collection("tests/\(userEmail)/brain-test").addDocument(data: [
            "timeStamp": timestamp,
            "chosenHand": handChosen,
            "KinesiaScore": totalTaps,
            "AkinesiaScore": timeHeldAvg,
            "IncorrdinationScore": timeBetweenAvg,
            "DysmetriaScore": accScore
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
