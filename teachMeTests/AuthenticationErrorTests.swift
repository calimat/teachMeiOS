//
//  AuthenticationErrorTests.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 5/11/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
@testable import teachMe

class AuthenticationErrorTests : XCTestCase {
    func testInitAuthenticationErrorWith17005_ReturnUserDisabledEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17005)
        
        XCTAssertEqual(AuthenticationError.userDisabled, authenticationError)
    }
    func testInitAuthenticationErrorWith17007_ReturnEmailAlreadyInUseEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17007)
        
        XCTAssertEqual(AuthenticationError.emailAlreadyInUse, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17008_ReturnInvalidEmailEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17008)
        
        XCTAssertEqual(AuthenticationError.invalidEmail, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17009ReturnWrongPasswordEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17009)
        
        XCTAssertEqual(AuthenticationError.wrongPassword, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17011ReturnUserNotFoundEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17011)
        
        XCTAssertEqual(AuthenticationError.userNotFound, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17012ReturnAccountExistsWithDifferentCredentialEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17012)
        
        XCTAssertEqual(AuthenticationError.accountExistsWithDifferentCredential, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17020ReturnNetworkErrorEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17020)
        
        XCTAssertEqual(AuthenticationError.networkError, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17025ReturnCredentialAlreadyInUseEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17025)
        
        XCTAssertEqual(AuthenticationError.credentialAlreadyInUse, authenticationError)
    }
    
    func testInitAuthenticationErrorWith17026ReturnInvalidPasswordEnum() {
        let authenticationError = AuthenticationError(rawvalue: 17026)
        
        XCTAssertEqual(AuthenticationError.invalidPassword, authenticationError)
    }
    
    func testInitAuthenticationErrorWithAnyOtherNumber_ReturnInvalidEmailEnum() {
        let authenticationError = AuthenticationError(rawvalue: 99999)
        
        XCTAssertEqual(AuthenticationError.unknown, authenticationError)
    }
    
    
    
}
