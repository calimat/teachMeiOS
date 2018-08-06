//
//  AuthDataServiceTests.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 8/5/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
import Firebase
@testable import teachMe


class AuthDataServiceTests: XCTestCase {
    
    var sut: AuthService!
    var mockAuth: MockFirebaseAuth!
    let error = NSError(domain:"", code:4, userInfo:nil)
    
    override func setUp() {
        super.setUp()
        sut = AuthService.instance
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testUnAuthenticatedLoginUser() {
        let fakeUser = FakeFirebaseUser()
        mockAuth.user = fakeUser
        sut.apiClient.signIn(withEmail: "rherrera@test.com", password: "password") { (success, error) in
            //
            if success {
                
            }
        }
       // waitForExpectation(with: 1.0)
    }
    
}

extension AuthDataServiceTests {
    class MockFirebaseAuth : FirebaseAuthProtocol {
        func createUser(withEmail email: String, password: String, completion: (Bool, Error?) -> ()) {
            //
        }
        
        func signIn(withEmail email: String, password: String, completion: (Bool, Error?) -> ()) {
            //
        }
        
        var error: Error?
        var user: FirebaseAuthProtocol?
        
    }
    
    class FakeFirebaseUser: FirebaseAuthProtocol {
        var uid: String {
            return "Fake uid"
        }
        
        var email: String? {
            return "fake@email.com"
        }
    }
    
}
