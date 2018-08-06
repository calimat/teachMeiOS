//
//  FirebaseAuthProtocol.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 8/5/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import Foundation

protocol FirebaseAuthProtocol {
    func createUser(withEmail email: String, password: String, completion: AuthServiceCompletionHandler)
    
    func signIn(withEmail email: String, password: String, completion: AuthServiceCompletionHandler)
}

struct FirebaseClient: FirebaseAuthProtocol {
    func createUser(withEmail email: String, password: String, completion: (Bool, Error?) -> ()) {
        //
    }
    
    func signIn(withEmail email: String, password: String, completion: (Bool, Error?) -> ()) {
        //
    }
    
    
}
