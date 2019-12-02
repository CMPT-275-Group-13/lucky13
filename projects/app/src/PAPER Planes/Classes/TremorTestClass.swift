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
    
    var dataTakenInterval = 1.00/60.0 // Default: have a 1/60 seconds interval to taken data
    
    // Holding arrays for Device Motion data
    private var xDMPitchDatas: [Double] = []
    private var yDMRollDatas: [Double] = []
    private var zDMYawDatas: [Double] = []
    
    // Holding arrays for Accelerometer data
    private var xAccelRawDatas: [Double] = []
    private var yAccelRawDatas: [Double] = []
    private var zAccelRawDatas: [Double] = []
    
    // Holding arrays for Gyroscope data
    private var xGyroRawDatas: [Double] = []
    private var yGyroRawDatas: [Double] = []
    private var zGyroRawDatas: [Double] = []
    
    var motion = CMMotionManager()
    
    
    // Start sampling and recording raw accelerometer data into the class's accelerometer array
    func startAccelerometer() {
        if motion.isAccelerometerAvailable {
            // Might want to reset the array first
            clearAccerlerometerArrayData()
            
            motion.accelerometerUpdateInterval = TimeInterval(dataTakenInterval)
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
    
    // Stop sampling with the Accelerometer
    func stopAccelerometer() {
        self.motion.stopAccelerometerUpdates()
    }
    
    // Output Accelerometer Standard Deviation data
    func getAccelerometerStdDev() -> (Any ,Double, Double, Double) {
        return (self.timestamp, standardDeviation(arr: self.xAccelRawDatas), standardDeviation(arr: self.yAccelRawDatas), standardDeviation(arr: self.zAccelRawDatas))
    }
    
    // Clear the Accelerometer data arrays
    func clearAccerlerometerArrayData() {
        xAccelRawDatas.removeAll()
        yAccelRawDatas.removeAll()
        zAccelRawDatas.removeAll()
    }
    
    // Start sampling and recording raw gyroscope data into the class's gyroscope array
    func startGyroscope() {
        if motion.isGyroAvailable {
            // Might want to reset the gyro array first
            clearAccerlerometerArrayData()
            
            motion.gyroUpdateInterval = TimeInterval(dataTakenInterval)
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
    
    // Stop sampling with the Gyroscope
    func stopGyroscope() {
        self.motion.stopGyroUpdates()
    }
    
    // Output Gyroscope Standard Deviation data
    func getGyroscopeStdDev() -> (Any ,Double, Double, Double) {
        return (self.timestamp, standardDeviation(arr: self.xAccelRawDatas), standardDeviation(arr: self.yAccelRawDatas), standardDeviation(arr: self.zAccelRawDatas))
    }
    
    // Clear the Gyroscope data arrays
    func clearGyroscopeArrayData() {
        xAccelRawDatas.removeAll()
        yAccelRawDatas.removeAll()
        zAccelRawDatas.removeAll()
    }
    
    // Start sampling and recording raw device motion data
    func startDeviceMotion() {
        if motion.isDeviceMotionActive {
            // Might want to reset the array first
            clearAccerlerometerArrayData()
            
            motion.deviceMotionUpdateInterval = TimeInterval(dataTakenInterval)
            motion.startDeviceMotionUpdates(to: .main) { (data, error) in
                guard let trueData = data, error == nil else {
                    return
                }
                
                // Saving current accelerometer data for use
                self.xAccelRawDatas.append(trueData.attitude.pitch)
                self.yAccelRawDatas.append(trueData.attitude.roll)
                self.zAccelRawDatas.append(trueData.attitude.yaw)
            }
        }
    }
    
    // Stop sampling with Device Motion
    func stopDeviceMotion() {
        self.motion.stopDeviceMotionUpdates()
    }
    
    // Output Device Motion Standard Deviation data
    func getDMStdDev() -> (Any ,Double, Double, Double) {
        return (self.timestamp, standardDeviation(arr: self.xAccelRawDatas), standardDeviation(arr: self.yAccelRawDatas), standardDeviation(arr: self.zAccelRawDatas))
    }
    
    // Clear the Device Motion data arrays
    func clearDeviceMotionData() {
        xDMPitchDatas.removeAll()
        yDMRollDatas.removeAll()
        zDMYawDatas.removeAll()
    }
    
    // Support function: calculate the standard deviation of an array
    private func standardDeviation(arr : [Double]) -> Double {
        var length = Double(arr.count)
        if length == 0 {
            length += 1
        }
        let avg = arr.reduce(0, {$0 + $1}) / length
        let sumOfSquaredAvgDiff = arr.map { pow($0 - avg, 2.0)}.reduce(0, {$0 + $1})
        return sqrt(sumOfSquaredAvgDiff / length)
    }
    
    // Support function: wait of a number of seconds
    private func waitFor(seconds wait: Int) {
        var countDown = wait
        Timer.scheduledTimer(withTimeInterval: Double(wait), repeats: false) { (timer) in
            countDown -= 1
        }
    }
    
    // Stop every sampling device immediately
    func stopTestAbrupt() {
        self.stopAccelerometer()
        self.stopGyroscope()
        self.stopDeviceMotion()
        self.clearGyroscopeArrayData()
        self.clearAccerlerometerArrayData()
        self.clearDeviceMotionData()
    }
}
