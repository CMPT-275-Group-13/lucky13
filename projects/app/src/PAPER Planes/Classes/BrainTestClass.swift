//
//  BrainTestClass.swift
//  PAPER Planes
//
//  Created by Quang minh Dinh on 2019-11-15.
//  Copyright © 2019 Quang minh Dinh. All rights reserved.
//

import Foundation

class BrainTestClass {
    // Make sure to specify which hand is doing the test when initialize
    // Each object represents one BRAIN test
    // BRAIN test variables
    var hand: String
    private var numTotalTaps = 0
    private var totalTimeHeld = 0.0
    private var totalTimeBetween = 0.0
    private var sumOfScore = 0
    
    // BrainTest properties
    private var correctButtons = [BrainTestCorrectButton]() // Array of correct buttons, * it's infact just 2 buttons
    
    // Flags for logic tracking
    private var isFirstButtonTapped = false // If the user tapped anything
    
    // Scoring criteria for Dysmetria Score (accuracy score)
    private let correctTapScore = 1
    private let wrongTapScore = 2
    private let reallyWrongTapScore = 3
    
    private func incrementTapScore(typeTap score: Int) {
        self.sumOfScore += score
    }
    
    // Resetting the accuracy score
    private func resetTapScore() {
        self.sumOfScore = 0
    }
    
    // Button logic for the BRAIN test
    // If first enter the test, wait for the user to touch the screen
    
    // Timers for timeHeld
    private var timeHeldSeconds = 0.0
    private let SampleTime = 0.0001
    private var timerHeld = Timer()
    
    private func startTimerHeld() {
        timerHeld = Timer.scheduledTimer(timeInterval: SampleTime, target: self, selector: #selector(updateTimerHeld), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimerHeld() {
        timeHeldSeconds += SampleTime
    }
    
    private func saveAndResetTimerHeld() {
        timerHeld.invalidate()
        totalTimeHeld = timeHeldSeconds
        timeHeldSeconds = 0
    }
    
    // Timers for timeBetween
    private var timeBetweenSeconds = 0.0
    private var timerBetween = Timer()
    
    private func startTimerBetween() {
        timerBetween = Timer.scheduledTimer(timeInterval: SampleTime, target: self, selector: #selector(updateTimerBetween), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimerBetween() {
        timeBetweenSeconds += SampleTime
    }
    
    private func saveAndResetTimerBetween() {
        timerBetween.invalidate()
        totalTimeBetween = timeBetweenSeconds
        timeBetweenSeconds = 0
    }
    
    // Public functions
    // Start the game when the user touched the test screen
    open func startGame(hand: String) {
        isFirstButtonTapped = true
    }
    
    // Currently Empty cause hand is already chosen in init
    func chooseHand() {}
    
    // To assign to touch down correct button
    open func correctButtonTappedIn(at index: Int) {
        
        if !correctButtons[index].isTapped {
            // Disabling the other correct button in controller
            saveAndResetTimerBetween()
            startTimerHeld()
            correctButtons[index].isTappedIn = true
        } else {
            // Treat tapping the correct button again as wrong tap
            numTotalTaps += 1
            incrementTapScore(typeTap: wrongTapScore)
        }
    }
    
    // To assign to touch up inside correct button
    open func correctButtonTappedOut(at index: Int) {
        // Only register tap out when tap in is acknowledged
        if correctButtons[index].isTappedIn {
            // reset tapped in
            correctButtons[index].isTappedIn = false
            correctButtons[index].isTapped = true
            
            // save and stop timerHeld
            saveAndResetTimerHeld()
            // start timerBetween
            startTimerBetween()
            
            // Updating score/numTotalTaps
            incrementTapScore(typeTap: correctTapScore)
            numTotalTaps += 1
        } else {
            return
        }
    }
    
    open func getCorrectButtonState(at index: Int) -> Bool {
        return correctButtons[index].isTapped
    }
    
    open func wrongButtonTapped() {
        saveAndResetTimerBetween()
        startTimerBetween()
        incrementTapScore(typeTap: wrongTapScore)
        numTotalTaps += 1
    }
    
    open func reallyWrongButtonTapped() {
        saveAndResetTimerBetween()
        startTimerBetween()
        incrementTapScore(typeTap: reallyWrongTapScore)
        numTotalTaps += 1
    }
    
    open func getGameState() -> Bool {
        return self.isFirstButtonTapped
    }
    
    // Use this function to get all data to send to firebase
    open func getResult() -> (Any, String, Int, Double, Double, Double) {
        let timestamp = NSDate().timeIntervalSince1970
        let totalTaps = numTotalTaps
        if totalTaps == 0 {
            // Return everything as 0 when totalTaps = 0
            return (timestamp, self.hand, 0, 0, 0, 0)
        }
        let timeHeldAvg = totalTimeHeld/Double(totalTaps)
        let timeBetweenAvg = totalTimeBetween/Double(totalTaps)
        let accuracy = Double(sumOfScore)/Double(totalTaps)
        //
        return (timestamp, self.hand, totalTaps, timeHeldAvg, timeBetweenAvg, accuracy)
    }
    
    init(handChosen: String, numberOfCorrectButtons: Int) {
        self.hand = handChosen
        for _ in 1...numberOfCorrectButtons {
            let tempCorrectButton = BrainTestCorrectButton()
            correctButtons.append(tempCorrectButton)
        }
    }
}
