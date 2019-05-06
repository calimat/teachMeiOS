//
//  AuthServiceTests.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 8/5/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
import Firebase

@testable import teachMe
class AuthServiceTests: XCTestCase {
    
    
    
    override func setUp() {
        super.setUp()
        FirebaseApp.configure()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testFireBaseSignInWithEmailIsEnabled() {
        let exp = expectation(description: "Service calls the wrong user")
        
        AuthService.instance.login(withEmail: "rherrera@test.com", andPassword: "password") { (status, error) in
            exp.fulfill()
            let currentError = error! as NSError
            XCTAssert(currentError.code == 17011, "\(currentError.debugDescription)")
            
        }

        waitForExpectations(timeout: 5) { (error) in
           XCTAssertNil(error)
        }
    }
  
    
  
    
}
