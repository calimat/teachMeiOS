//
//  teachmeLoginFlowUITests.swift
//  teachMeUITests
//
//  Created by Ricardo Herrera Petit on 5/5/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import Foundation

import XCTest

class teachmeLoginFlowUITests : XCTestCase {
    
    var application:XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
    }
    
    override func tearDown() {
        application = nil
    }
    
    func test_UserShouldSeeLoginVCController() {
       XCTAssertTrue(application.textFields["email"].exists)
    }
    
    func test_CreateAccountButton_ShouldShowCreateAccountVC() {
       navigateToCreateAccountVC()
        XCTAssertTrue(application.staticTexts["Would you like to create an acocunt for:"].exists)
    }
    
    func testCreateAccountBackBtn_ShouldReturntoLoginVC() {
        navigateToCreateAccountVC()
        application.buttons["backBtnToLoginVC"].tap()
        XCTAssertTrue(application.buttons["Don't Have an Account? Tap Here"].exists)
    }
    
//    func testCreateAccountBtnPressed_ShouldChangetoProfileVC() {
//        navigateToCreateAccountVC()
//        let emailTextField = application.textFields["email2"]
//        emailTextField.tap()
//        var count = arc4random()
//        emailTextField.typeText("rherrera12@test.com")
//        let passwordTextField = application.secureTextFields["password2"]
//        passwordTextField.tap()
//        passwordTextField.typeText("password")
//        let teachMeLbl = application.staticTexts["teachme2"]
//        teachMeLbl.tap()
//        let originalCreateAccountBtn = application.buttons["createAccountBtnFromVC"]
//        originalCreateAccountBtn.tap()
//        let profileLbl = application.staticTexts["Profile"]
//        
//        let exists = NSPredicate(format: "exists == true")
//        expectation(for: exists, evaluatedWith: profileLbl, handler: nil)
//        XCTAssert(profileLbl.exists)
//        waitForExpectations(timeout: 5, handler: nil)
//
//    }


    func navigateToCreateAccountVC() {
        let createAccountBtn = application.buttons["Don't Have an Account? Tap Here"]
        createAccountBtn.tap()
        
    
}
}
