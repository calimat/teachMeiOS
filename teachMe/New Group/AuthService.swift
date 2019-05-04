//
//  AuthService.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 8/5/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func login(withEmail email:String, andPassword password:String,  loginComplete:@escaping (_ status:Bool, _ error:Error?) -> () ) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard user != nil else {
                loginComplete(false,error)
                return
            }
            loginComplete(true,nil)
        }
    }
}
