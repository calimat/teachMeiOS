//
//  AuthenticationGatewayStub.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 5/11/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import Foundation
@testable import teachMe

class AuthenticationGatewayStub : AuthenticationGateway {
    func register(email: String, password: String, accountType: AccountType) {
        if email.isEmpty {
            failure()
        } else {
            success()
        }
    }
    
    var registeredUser : UserEntity? = nil
    
    func failure() {
        registeredUser = nil
    }
    
    func success() {
        registeredUser = UserEntity(identifier: "dummyId", email: "rherrera@test.com", accountType: "Student")
    }
    
}
