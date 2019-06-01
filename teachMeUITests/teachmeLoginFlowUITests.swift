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
    
    func testCreateAccountBtnPressedWithSameUser_ShouldDisplayErrorLabel() {
        navigateToCreateAccountVC()
        completeFieldsForRegistration(for:"createAccountBtnFromVC" )
        
        let errorLbl = application.staticTexts["createAccountErrorLbl"]
        
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: errorLbl, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
         XCTAssert(errorLbl.exists)
    }
    
    func test_LoginWithValidCredentials_ShouldDisplaySecondScreen() {
       completeFieldsForRegistration(for: "loginBtn")
        
        let profileLbl = application.staticTexts["profileLbl"]
        
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: profileLbl, handler: nil)
        waitForExpectations(timeout: 5) { _ in
            XCTAssert(profileLbl.exists)
            //click logoutbutton
          let logoutBtn = self.application.buttons["logoutBtn"]
           logoutBtn.tap()
        }
        
    }


    func completeFieldsForRegistration(for buttonId: String) {
        let emailTextField = application.textFields["email"]
        emailTextField.tap()
        emailTextField.typeText("studentmaster@test.com")
        let passwordTextField = application.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("testing")
        
        let teachMeLbl = application.staticTexts["teachme"]
        teachMeLbl.tap()
        let actionButton = application.buttons[buttonId]
        actionButton.tap()
    }
    
    func navigateToCreateAccountVC() {
        let createAccountBtn = application.buttons["Don't Have an Account? Tap Here"]
        createAccountBtn.tap()
        
    
}
}
