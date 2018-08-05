//
//  LoginUITests.swift
//  teachMeUITests
//
//  Created by Ricardo Herrera Petit on 8/4/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import XCTest

class LoginUITests: XCTestCase {
        
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
    
    func testButtonHasToBeDisabledIfUsernameAndPasswordFieldsAreEmpty() {
        
        let app = XCUIApplication()
        let button = app.buttons["LOGIN"]
        XCTAssert(!button.isEnabled, "Button should be disabled when Password and TextFields are empty")

    }
    
    func testButtonHasToBeEnabledIfUserNameAndPasswordFieldsAreNotEmpty() {
        
        
        let app = XCUIApplication()
        let userNameTextField =    app.textFields["username"]
        userNameTextField.tap()
        userNameTextField.typeText("rherrera")
        
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        let loginButton = app.buttons["LOGIN"]
        loginButton.tap()
       
        XCTAssert(loginButton.isEnabled, "Button should be enabled when Password and Textfields are not empty")

      
    }
    
}
