//
//  LoginVCTests.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 8/4/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
@testable import teachMe

class LoginVCTests: XCTestCase {
    
    var sut : LoginVC!
    
    override func setUp() {
        super.setUp()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        sut.loadView() // This line is the key
        sut.viewDidLoad()

    }
    
    func test_HasUserNameTextField() {
        guard let usernameTextField = sut.usernameTxtField else { XCTFail(); return}
        XCTAssertNotNil(usernameTextField)
    }
    
    func test_HasPasswordTextField() {
        guard let passwordTextField = sut.passwordTxtField else { XCTFail(); return }
        XCTAssert(passwordTextField.isSecureTextEntry, "Not secured")
    }
    
    func test_HasloginBtn() {
        guard let loginBtn = sut.loginBtn else { XCTFail(); return }
        XCTAssertNotNil(loginBtn)
    }
    
    func test_HasButtonToPresentCreateAccountVC() {
        guard let createAccountBtn = sut.createAccountBtn else { XCTFail(); return }
        XCTAssertNotNil(createAccountBtn)
    }
    
    func test_userNameTextFieldPlaceHolderTextColor_ShouldBeWhiteChalkColor() {
         guard let usernameTextField = sut.usernameTxtField else { XCTFail(); return}
        guard let placeHolderColor = usernameTextField.attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { XCTFail(); return }
        XCTAssertEqual(placeHolderColor,  #colorLiteral(red: 1, green: 0.9960784314, blue: 0.9764705882, alpha: 1))
    }
    
    func testUserNameTextFieldPlaceHolder_ShouldsayEmail() {
         guard let usernameTextField = sut.usernameTxtField else { XCTFail(); return}
        XCTAssertEqual(usernameTextField.placeholder, "email")
    }
    
    func testPasswordTextFieldPlaceHolder_ShouldSayPassword() {
        guard let passwordTextField = sut.passwordTxtField else { XCTFail(); return }
        XCTAssertEqual(passwordTextField.placeholder, "password")
    }
    
    func test_passwordTextFieldPlaceHolderTextColor_ShouldBeWhiteChalkColor() {
        guard let usernameTextField = sut.passwordTxtField else { XCTFail(); return}
        guard let placeHolderColor = usernameTextField.attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { XCTFail(); return }
        XCTAssertEqual(placeHolderColor,  #colorLiteral(red: 1, green: 0.9960784314, blue: 0.9764705882, alpha: 1))
    }
    
}

