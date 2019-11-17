//
//  ViewControllerBrainTest.swift
//  PAPER Planes
//
//  Created by Quang Minh Dinh on 2019-11-01.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerBrainTest: UIViewController {
    override open var shouldAutorotate: Bool {
        return true
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startCountdown()
    }
    
    lazy var BrainTest = BrainTestClass(handChosen: "Right", numberOfCorrectButtons: correctButtons.count)
    
    @IBOutlet var correctButtons: [UIButton]!
    
    @IBAction func touchDownCorrectButtons(_ sender: UIButton) {
        if let correctButtonNumber = correctButtons.index(of: sender) {
            if !BrainTest.getGameState() {
                BrainTest.startGame(hand: "Right")
            }
            BrainTest.correctButtonTappedIn(at: correctButtonNumber)
        }
    }
    
    @IBAction func touchUpInsideCorrectButtons(_ sender: UIButton) {
        if let correctButtonNumber = correctButtons.index(of: sender) {
            BrainTest.startGame(hand: "Right")
            BrainTest.correctButtonTappedOut(at: correctButtonNumber)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        BrainTest.startGame(hand: "Right")
        BrainTest.reallyWrongButtonTapped()
    }
    
    @IBAction func wrongTap(_ sender: UIButton) {
        BrainTest.startGame(hand: "Right")
        BrainTest.wrongButtonTapped()
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
        return testResultText
    }
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    //let testLength = 60
    var totalTime = 5
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
        //        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //        guard let viewControllerBrainTestResult = mainStoryboard.instantiateViewController(withIdentifier: "ViewControllerBrainTestResult") as? ViewControllerBrainTestResult else {
        //            print("Couldn't find ViewControllerBrainTestResult")
        //            return
        //        }
        
        //present(viewControllerBrainTestResult, animated: true, completion: nil)
        
        
        //_ = getTestResultText()
        performSegue(withIdentifier: "resultTransition", sender: self)
        //navigationController?.pushViewController(viewControllerBrainTestResult, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultTransition" {
            let testResultText = getTestResultText()
            let vc = segue.destination as! ViewControllerBrainTestResult
            vc.resultText = testResultText
        } else {
            return
        }
    }
    
    // TODO: Implement the MVC design for the BRAIN test in rev 2
    func updateViewFromModel() {
        
    }
}
