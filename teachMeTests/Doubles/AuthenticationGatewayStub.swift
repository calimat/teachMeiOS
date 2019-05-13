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
   
    
  
    
    var registeredUser : UserEntity? = nil
    var registerResult: Result<UserEntity, AuthenticationError>?
    

    func register(email: String, password: String, accountType: String, completion: @escaping (Result<UserEntity, AuthenticationError>) -> Void) {
        guard let registerResult = registerResult else { return }
        switch registerResult {
        case .failure(_):
            registeredUser = nil
        case .success(_):
            registeredUser = UserEntity(identifier: nil, email: email, accountType: accountType)
        }
        completion(registerResult)
    }

    
    func failure(error: AuthenticationError) {
        registeredUser = nil
    }
    
    func success() {
        registeredUser = UserEntity(identifier: "dummyId", email: "rherrera@test.com", accountType: AccountType.Student.rawValue)
    }
    
}
