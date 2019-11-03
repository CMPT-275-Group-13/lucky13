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
    
    // Time on buttons functions
    //----------------------------------------------------------
    var tapTimer = Timer()
    @IBOutlet weak var TimerLabel: UILabel!
    
    func schedulingTimeOnButton() {
        tapTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds += 0.001
        TimerLabel.text = "Timer: \(seconds)"
    }
    
    func resetTimerOnButton() {
        tapTimer.invalidate()
        seconds = 0
        TimerLabel.text = "Timer: \(seconds)"
    }
    //----------------------------------------------------------
    // End
    
    // Minute countdown functions
    //----------------------------------------------------------
    @IBOutlet weak var countdownLabel: UILabel!
    
    var totalTime = 60
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
    }
    //----------------------------------------------------------
    // End
    
    var wrongTapCount = 0
    var correctTapCount = 0
    var sumOfSecondsOnButton = 0.0
    var isLeftButtonPressed = false
    var isRightButtonPressed = false
    
    var seconds = 0.0
    var secondsForMinuteCountdown = 0
    var secondsForTimeBetweenTaps = 0.0
    
    
    var inBetweenTapsTimer = Timer()
    // TODO: timer won't be accurate when the app is running hard and slowing down
    var timerIsOn = false
    
    @IBOutlet weak var wrongTabLabel: UILabel!
    
    @IBAction func WrongTap(_ sender: UIButton) {
        wrongTapCount += 1
        wrongTabLabel.text = "wrong count: \(wrongTapCount)"
    }
    
    @IBAction func TouchDownTapLeft(_ sender: UIButton) {
        if !isLeftButtonPressed && !isRightButtonPressed {
            startCountdown()
        }
        
        schedulingTimeOnButton()
        isLeftButtonPressed = true
        isRightButtonPressed = false
    }
    
    @IBAction func TouchDownTapRight(_ sender: UIButton) {
        if !isLeftButtonPressed && !isRightButtonPressed {
            startCountdown()
        }
        schedulingTimeOnButton()
        
        isRightButtonPressed = true
        isLeftButtonPressed = false
    }
    
    @IBAction func TouchUpTapLeft(_ sender: UIButton) {
        
        print("Milliseconds on button left: \(seconds)")
        sumOfSecondsOnButton += seconds
        resetTimerOnButton()
        
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
        
        print("Milliseconds on button right: \(seconds)")
        sumOfSecondsOnButton += seconds
        resetTimerOnButton()
        
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
    
    
    func getAverageSecondsOnButton() -> Double {
        return sumOfSecondsOnButton/Double(correctTapCount)
    }
    
    func getTapAccuracy() -> Double {
        return Double(correctTapCount / (correctTapCount + wrongTapCount))
    }
    
    func getTotalKeyTaps() -> Int {
        return correctTapCount + wrongTapCount
    }
    
    
    func updateViewFromModel() {
        
    }
    
    func countDownOneMinute() {
        
    }
}
