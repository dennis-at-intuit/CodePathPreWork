//
//  TippyUITests.swift
//  TippyUITests
//
//  Created by Lin, Dennis on 3/12/17.
//  Copyright © 2017 Lin, Dennis. All rights reserved.
//

import XCTest

class TippyUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample2() {
        let app = XCUIApplication()
        let element = app.otherElements.containing(.navigationBar, identifier:"Tip Calculator").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textField = element.children(matching: .textField).element
        app.buttons["25%"].tap()
        app.keys["1"].tap()
        app.keys["0"].tap()
        var tipAmount = app.staticTexts["labelTipAmount"].label
        var totalBill = app.staticTexts["labelTotalBill"].label
        
        print("Found tip amount: " + tipAmount)
        print("Found total bill: " + totalBill)
        XCTAssert(tipAmount == "$2.50")
        XCTAssert(totalBill == "$12.50")
        
        app.navigationBars["Tip Calculator"].staticTexts["Tip Calculator"].tap()
        
        app.keys["0"].tap()
        tipAmount = app.staticTexts["labelTipAmount"].label
        totalBill = app.staticTexts["labelTotalBill"].label
        
        XCTAssert(tipAmount == "$25.00")
        XCTAssert(totalBill == "$125.00")
        
        print("Found tip amount: " + tipAmount)
        print("Found total bill: " + totalBill)
    }
}
