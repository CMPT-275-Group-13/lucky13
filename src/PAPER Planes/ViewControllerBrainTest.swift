//
//  ViewControllerBrainTest.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit

class ViewControllerBrainTest: UIViewController {
    // Don't allow auto rotate
    override open var shouldAutorotate: Bool {
        return true
    }
    
    // Make sure the test are run in Landscape mode
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
   
    @IBOutlet var correctButtons: [UIButton]!
    
    @IBOutlet weak var wrongTabLabel: UILabel!
    
    let timeIncrementMS = 0.001
    let timeIncrementS = 1
    let timeReset = Double(0)
    
    
    // Time on buttons functions
    //----------------------------------------------------------
    var tapTimer = Timer()
    var seconds = 0.0
    @IBOutlet weak var TimerLabel: UILabel!
    
    func schedulingTimeOnButton() {
        tapTimer = Timer.scheduledTimer(timeInterval: timeIncrementMS, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds += timeIncrementMS
        TimerLabel.text = "Timer: \(seconds)"
    }
    
    func saveSecondsOnButton() {
        print("Milliseconds on button left: \(seconds)")
        // saving seconds on Button to get the average
        sumOfSecondsOnButton += seconds
    }
    
    func resetTimerOnButton() {
        tapTimer.invalidate()
        seconds = timeReset
        TimerLabel.text = "Timer: \(seconds)"
    }
    //----------------------------------------------------------
    // End
    
    
    // Minute countdown functions
    //----------------------------------------------------------
    @IBOutlet weak var countdownLabel: UILabel!
    
    //let testLength = 60
    var totalTime = 15
    var countdownTimer = Timer()
    
    func startCountdown() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        countdownLabel.text = "Countdown: \(totalTime)"
        
        if totalTime != 0 {
            totalTime -= timeIncrementS
        } else {
            endCountdown()
        }
    }
    
    func endCountdown() {
        countdownTimer.invalidate()
        // TODO: display the test result and go back to the menu page
    }
    //----------------------------------------------------------
    // End
    
    
    // Timer for in between taps
    //----------------------------------------------------------
    var inBetweenTimer = Timer()
    @IBOutlet weak var inBetweenTimerLabel: UILabel!
    var secondsBetweenTaps = 0.0
    
    func startInBetweenTimer() {
        inBetweenTimer = Timer.scheduledTimer(timeInterval: timeIncrementMS, target: self, selector: #selector(updateInBetweenTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateInBetweenTime() {
        inBetweenTimerLabel.text = "Switch Timer: \(secondsBetweenTaps)"
        secondsBetweenTaps += timeIncrementMS
        inBetweenTimerLabel.text = "Switch Timer: \(secondsBetweenTaps)"
    }
    
    func endInBetweenTimer() {
        
        inBetweenTimer.invalidate()
        secondsBetweenTaps = timeReset
        inBetweenTimerLabel.text = "Switch Timer: \(secondsBetweenTaps)"
    }
    
    //----------------------------------------------------------
    // End
    
    var wrongTapCount = 0
    var correctTapCount = 0
    var sumOfSecondsOnButton = 0.0
    var isLeftButtonPressed = false
    var isRightButtonPressed = false
    
    
    // If both buttons are not pressed, then the test hasn't started yet
    // Start the 1 minute countdown when the user press the first button
    
    
    // Reminder: timer won't be accurate when the app is running hard and slowing down
    
    
    
    @IBAction func WrongTap(_ sender: UIButton) {
        incrementWrongTap()
    }
    
    @IBAction func TouchDownTapLeft(_ sender: UIButton) {
        if !isLeftButtonPressed && !isRightButtonPressed {
            startCountdown()
        } else {
            endInBetweenTimer()
        }
        
        if isLeftButtonPressed {
            incrementWrongTap()
        }
        
        schedulingTimeOnButton()
        isLeftButtonPressed = true
        isRightButtonPressed = false
    }
    
    @IBAction func TouchDownTapRight(_ sender: UIButton) {
        if !isLeftButtonPressed && !isRightButtonPressed {
            startCountdown()
        } else {
            endInBetweenTimer()
        }
        
        if isRightButtonPressed {
            incrementWrongTap()
        }
        schedulingTimeOnButton()
        
        isRightButtonPressed = true
        isLeftButtonPressed = false
    }
    
    @IBAction func TouchUpTapLeft(_ sender: UIButton) {
        
        saveSecondsOnButton()
        resetTimerOnButton()
        
        startInBetweenTimer()
        
        /*if !isRightButtonPressed && !isLeftButtonPressed {
            // Increment correct key taps
            correctTapCount += 1
            
            // Updating flags
            isLeftButtonPressed = true
            isRightButtonPressed = false
        } else {
            wrongTapCount += 1
            wrongTabLabel.text = "wrong count: \(wrongTapCount)"
        }*/
    }
    
    @IBAction func TouchUpTapRight(_ sender: UIButton) {
        
        saveSecondsOnButton()
        resetTimerOnButton()
        
        startInBetweenTimer()
        
        /*if !isRightButtonPressed && !isLeftButtonPressed {
            // Increment correct key taps
            correctTapCount += 1
            
            // Updating flags
            isRightButtonPressed = true
            isLeftButtonPressed = false
        } else {
            wrongTapCount += 1
            wrongTabLabel.text = "wrong count: \(wrongTapCount)"
        }*/
    }
    
    
    
    // Supporting functions
    
    // TODO: Transfer the results to the result view
//    func transitionToResult() {
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let brainTestResultViewController = mainStoryboard.instantiateViewController(withIdentifier: "BrainTestResultViewController") as? BrainTestResultViewController else {
//            print("Couldn't find BrainTestResultViewController")
//            return
//        }
//
//    }
    
    func incrementWrongTap() {
        wrongTapCount += 1
        wrongTabLabel.text = "wrong count: \(wrongTapCount)"
    }
    
    func getAverageSecondsOnButton() -> Double {
        return sumOfSecondsOnButton/Double(correctTapCount)
    }
    
    func getTapAccuracy() -> Double {
        let totalTaps = correctTapCount
        return Double(correctTapCount / totalTaps)
    }
    
    func getTotalKeyTaps() -> Int {
        return correctTapCount + wrongTapCount
    }
    
    // TODO: Implement the MVC design for the BRAIN test in rev 2
    func updateViewFromModel() {
        
    }
}
