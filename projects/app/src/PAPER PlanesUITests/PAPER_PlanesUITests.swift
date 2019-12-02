//
//  PAPER_PlanesUITests.swift
//  PAPER PlanesUITests
//
//  Created by Angus Kan on 2019-10-31.
//  Copyright © 2019 Angus Kan. All rights reserved.
//

import XCTest

class PAPER_PlanesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMain() {
        let app = XCUIApplication()
        let app2 = app
        app.scrollViews.otherElements.buttons["Sign in with email"].tap()
        
        let tablesQuery = app2.tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Enter your email"]/*[[".cells[\"EmailCellAccessibilityID\"].textFields[\"Enter your email\"]",".textFields[\"Enter your email\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let sKey = app2/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        
        let mKey = app2/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        
        let iKey = app2/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let tKey = app2/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tKey.tap()
        
        let hKey = app2/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()
        
        let moreKey = app2/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        moreKey.tap()
        
        let moreKey2 = app2/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, letters\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey2.tap()
        moreKey2.tap()
        
        let key = app2/*@START_MENU_TOKEN@*/.keys["@"]/*[[".keyboards.keys[\"@\"]",".keys[\"@\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        app2/*@START_MENU_TOKEN@*/.keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        mKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        iKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["."]/*[[".keyboards.keys[\".\"]",".keys[\".\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2.keys["c"].tap()
        app2/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        mKey.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"Next\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Password"]/*[[".cells.staticTexts[\"Password\"]",".staticTexts[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.secureTextFields["Enter your password"]/*[[".cells.secureTextFields[\"Enter your password\"]",".secureTextFields[\"Enter your password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIDevice.shared.orientation = .faceUp
        XCUIDevice.shared.orientation = .portrait
        moreKey.tap()
        app2/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let key2 = app2/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        app2/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let key3 = app2/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Next:"]/*[[".keyboards",".buttons[\"Next\"]",".buttons[\"Next:\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let stabilizerButton = app.buttons["Stabilizer"]
        stabilizerButton.tap()
        stabilizerButton.tap()
        stabilizerButton.tap()
        
        let checkUpButton = app.buttons["Check-up"]
        checkUpButton.tap()
        
        let chelseaSmithButton = app.navigationBars["Test Selection"].buttons["Chelsea Smith"]
        chelseaSmithButton.tap()
        stabilizerButton.tap()
        app.buttons["Doctors"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Jane Doe"]/*[[".cells.staticTexts[\"Jane Doe\"]",".staticTexts[\"Jane Doe\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textViews.containing(.staticText, identifier:"Aa").element.tap()
        
        app2.keys["U"].tap()
        let shiftButton = app2/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        shiftButton.tap()
        app2/*@START_MENU_TOKEN@*/.keys["I"]/*[[".keyboards.keys[\"I\"]",".keys[\"I\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["space"]/*[[".keyboards.keys[\"space\"]",".keys[\"space\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        shiftButton.tap()
        app2/*@START_MENU_TOKEN@*/.keys["T"]/*[[".keyboards.keys[\"T\"]",".keys[\"T\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sKey.tap()
        tKey.tap()
        app.buttons["Send"].tap()
        app.navigationBars["Jane Doe"].buttons["Doctors"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Herbert Tsang"]/*[[".cells.staticTexts[\"Herbert Tsang\"]",".staticTexts[\"Herbert Tsang\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Herbert Tsang"].buttons["Doctors"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["QA Test"]/*[[".cells.staticTexts[\"QA Test\"]",".staticTexts[\"QA Test\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["QA Test"].buttons["Doctors"].tap()
        app.navigationBars["Doctors"].buttons["Chelsea Smith"].tap()
        checkUpButton.tap()
        app.buttons["BRAIN Test"].tap()
        XCUIDevice.shared.orientation = .landscapeLeft
        
        let element = app.otherElements.containing(.navigationBar, identifier:"BRAIN Test").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let tapHereButton = element.children(matching: .button).matching(identifier: "TAP HERE").element(boundBy: 0)
        tapHereButton.tap()
        
        let tapHereButton2 = element.children(matching: .button).matching(identifier: "TAP HERE").element(boundBy: 1)
        tapHereButton2.tap()
        tapHereButton.tap()
        app.buttons["Left"].tap()
        tapHereButton.tap()
        tapHereButton2.tap()
        tapHereButton.tap()
        tapHereButton2.tap()
        tapHereButton.tap()
        tapHereButton2.tap()
        tapHereButton.tap()
        tapHereButton2.tap()
        tapHereButton.tap()
        sleep(30)
        app.buttons["Return"].tap()
        XCUIDevice.shared.orientation = .portrait
        app.navigationBars["BRAIN Test"].buttons["Test Selection"].tap()
        app.buttons["Tremor Test"].tap()
        app.buttons["Tap here to start the test"].tap()
        XCUIDevice.shared.orientation = .faceUp
        XCUIDevice.shared.orientation = .portrait
        XCUIDevice.shared.orientation = .landscapeLeft
        XCUIDevice.shared.orientation = .portrait
        app.navigationBars["Tremor Test"].buttons["Test Selection"].tap()
        chelseaSmithButton.tap()
        
        let medicationButton = app.buttons["Medication"]
        medicationButton.tap()
        
        let chelseaSmithButton2 = app.navigationBars["Medication Schedule"].buttons["Chelsea Smith"]
        chelseaSmithButton2.tap()
        medicationButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Bacon"]/*[[".cells.staticTexts[\"Bacon\"]",".staticTexts[\"Bacon\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        chelseaSmithButton2.tap()
    }

}


