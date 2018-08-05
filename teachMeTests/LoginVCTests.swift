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
        sut = mainStoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        sut.loadView() // This line is the key
        sut.viewDidLoad()

    }
    
    func testHasPasswordTextField() {
        guard let passwordTextField = sut.passwordTxtField else { XCTFail(); return }
        XCTAssert(passwordTextField.isSecureTextEntry, "Not secured")
    }
    
}

