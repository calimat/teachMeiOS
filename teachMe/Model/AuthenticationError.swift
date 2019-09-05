//
//  File.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/11/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

enum AuthenticationError : Error {
    case userDisabled
    case emailAlreadyInUse
    case invalidEmail
    case wrongPassword
    case unknown
    case userNotFound
    case networkError
    case credentialAlreadyInUse
    case invalidPassword
    case accountExistsWithDifferentCredential
    case invalidName
    
    init(rawvalue: Int) {
        switch rawvalue {
        case 17005: self = .userDisabled
        case 17007: self = .emailAlreadyInUse
        case 17008: self = .invalidEmail
        case 17009: self = .wrongPassword
        case 17011: self = .userNotFound
        case 17012: self = .accountExistsWithDifferentCredential
        case 17020: self = .networkError
        case 17025: self = .credentialAlreadyInUse
        case 17026: self = .invalidPassword
            
        default: self = .unknown
        
    }
}
}
