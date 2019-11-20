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
    private var timestamp = NSDate().timeIntervalSince1970
    
    
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
    var dataTakenInterval = 0.5 // Default: have a 1/60 seconds interval to taken data
    var testDuration = 5 // Default: have the tremor test run for 30 seconds
    
    private var xDMPitchDatas: [Double] = []
    private var yDMRollDatas: [Double] = []
    private var zDMYawDatas: [Double] = []
    
    private var xAccelRawDatas: [Double] = []
    private var yAccelRawDatas: [Double] = []
    private var zAccelRawDatas: [Double] = []
    
    private var xGyroRawDatas: [Double] = []
    private var yGyroRawDatas: [Double] = []
    private var zGyroRawDatas: [Double] = []
    
    var motion = CMMotionManager()
    
    //    init(waitTime: Int, dataInterval: Double, testDuration: Int) {
    //        self.waitTestStart = waitTime
    //        self.dataTakenInterval = dataInterval
    //        self.testDuration = testDuration
    //    }
    
    
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
        } else {
            print("Don't have accelerometer")
        }
    }
    
    func stopAccelerometer() {
        self.motion.stopAccelerometerUpdates()
    }
    
    func getAccelerometerData() -> (Any ,[Double], [Double], [Double]) {
        return (self.timestamp, self.xAccelRawDatas, self.yAccelRawDatas, self.zAccelRawDatas)
    }
    
    func recordAccelerometer() {
        startAccelerometer()
        // Wait for 'duration' seconds
        waitFor(seconds: testDuration)
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
    
    func recordGyroscope() {
        startGyroscope()
        // Wait for 'duration' seconds
        waitFor(seconds: testDuration)
        stopGyroscope()
    }
    
    func clearGyroscopeArrayData() {
        xAccelRawDatas.removeAll()
        yAccelRawDatas.removeAll()
        zAccelRawDatas.removeAll()
    }
    
    func startDeviceMotion() {
        if motion.isDeviceMotionActive {
            // Might want to reset the array first
            clearAccerlerometerArrayData()
            
            motion.deviceMotionUpdateInterval = dataTakenInterval
            motion.startDeviceMotionUpdates(to: .main) { (data, error) in
                guard let trueData = data, error == nil else {
                    return
                }
                
                // Saving current accelerometer data for use
                self.xAccelRawDatas.append(trueData.attitude.pitch)
                self.yAccelRawDatas.append(trueData.attitude.roll)
                self.zAccelRawDatas.append(trueData.attitude.yaw)
            }
        } else {
            print("Don't have Device Motion")
        }
    }
    
    func stopDeviceMotion() {
        self.motion.stopDeviceMotionUpdates()
    }
    
    func recordDeviceMotion() {
        startDeviceMotion()
        // Wait for 'duration' seconds
        waitFor(seconds: self.testDuration)
        stopDeviceMotion()
    }
    
    func clearDeviceMotionData() {
        xDMPitchDatas.removeAll()
        yDMRollDatas.removeAll()
        zDMYawDatas.removeAll()
    }
    
    
    private func waitFor(seconds wait: Int) {
        var countDown = wait
        Timer.scheduledTimer(withTimeInterval: Double(wait), repeats: false) { (timer) in
            print("\(countDown)")
            countDown -= 1
        }
    }
    
    func waitForStartTest() {
        waitFor(seconds: waitTestStart)
    }
    
    func getDeviceMotionResult() -> (Any ,[Double], [Double], [Double]) {
        return (self.timestamp, self.xDMPitchDatas, self.yDMRollDatas, self.zDMYawDatas)
    }
    
    func stopTestAbrupt() {
        self.stopAccelerometer()
        self.stopGyroscope()
        self.stopDeviceMotion()
        self.clearGyroscopeArrayData()
        self.clearAccerlerometerArrayData()
        self.clearDeviceMotionData()
    }
}
