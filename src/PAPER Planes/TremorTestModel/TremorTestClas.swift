//
//  TremorTestClass.swift
//  TremorTestSingle
//
//  Created by Quang minh Dinh on 11/14/19.
//  Copyright © 2019 Quang minh Dinh. All rights reserved.
//

import Foundation
import CoreMotion

class TremorTestClass {
    
    var dateTaken = Date()
    var timestamp = NSDate().timeIntervalSince1970
    
    
    //    var timer = Timer()
    //    var timerSeconds = 0
    //    func initializeTimer() {
    //        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TremorTestClass.updateTimer), userInfo: nil, repeats: true)
    //    }
    //
    //    @objc func updateTimer() {
    //        timerSeconds += 1
    //    }
    //
    //    func resetTimer() {
    //        timer.invalidate()
    //        timerSeconds = 0
    //    }
    
    var waitTestStart = 10 // Default: wait 10 seconds before starting test
    var dataTakenInterval = 1.0/60.0 // Default: have a 1/60 seconds interval to taken data
    var testDuration = 30 // Default: have the tremor test run for 30 seconds
    
    var xAccelRawDatas: [Double] = []
    var yAccelRawDatas: [Double] = []
    var zAccelRawDatas: [Double] = []
    
    var xGyroRawDatas: [Double] = []
    var yGyroRawDatas: [Double] = []
    var zGyroRawDatas: [Double] = []
    
    var motion = CMMotionManager()
    
    init(waitTime: Int, dataInterval: Double, testDuration: Int) {
        self.waitTestStart = waitTime
        self.dataTakenInterval = dataInterval
        self.testDuration = testDuration
    }
    
    
    // Start recording raw accelerometer data into the class's accelerometer array
    func startAccelerometer() {
        if motion.isAccelerometerAvailable {
            // Might want to reset the array first
            clearAccerlerometerArrayData()
            
            motion.accelerometerUpdateInterval = dataTakenInterval
            motion.startAccelerometerUpdates(to: .main) { (data, error) in
                guard let trueData = data, error == nil else {
                    return
                }
                
                // Saving current accelerometer data for use
                self.xAccelRawDatas.append(trueData.acceleration.x)
                self.yAccelRawDatas.append(trueData.acceleration.y)
                self.zAccelRawDatas.append(trueData.acceleration.z)
            }
        }
    }
    
    func stopAccelerometer() {
        self.motion.stopAccelerometerUpdates()
    }
    
    func recordAccelerometerFor(seconds duration: Int) {
        startAccelerometer()
        // Wait for 'duration' seconds
        waitFor(seconds: duration)
        stopAccelerometer()
    }
    
    func clearAccerlerometerArrayData() {
        xAccelRawDatas.removeAll()
        yAccelRawDatas.removeAll()
        zAccelRawDatas.removeAll()
    }
    
    func startGyroscope() {
        if motion.isGyroAvailable {
            // Might want to reset the gyro array first
            clearAccerlerometerArrayData()
            
            motion.gyroUpdateInterval = dataTakenInterval
            motion.startGyroUpdates(to: .main) { (data, error) in
                guard let trueData = data, error == nil else {
                    return
                }
                
                // Saving current gyroscope data for use
                self.xGyroRawDatas.append(trueData.rotationRate.x)
                self.yGyroRawDatas.append(trueData.rotationRate.y)
                self.zGyroRawDatas.append(trueData.rotationRate.z)
            }
        }
    }
    
    func stopGyroscope() {
        self.motion.stopGyroUpdates()
    }
    
    func recordGyroscopeFor(seconds duration: Int) {
        startGyroscope()
        // Wait for 'duration' seconds
        waitFor(seconds: duration)
        stopGyroscope()
    }
    
    func clearGyroscopeArrayData() {
        xAccelRawDatas.removeAll()
        yAccelRawDatas.removeAll()
        zAccelRawDatas.removeAll()
    }
    
    func waitFor(seconds wait: Int) {
        Timer.scheduledTimer(withTimeInterval: Double(wait), repeats: false) { (timer) in
        }
    }
    
    
    func waitForStartTest() {
        waitFor(seconds: waitTestStart)
    }
    
    func stopTestAbrupt() {
        
    }
    
}
