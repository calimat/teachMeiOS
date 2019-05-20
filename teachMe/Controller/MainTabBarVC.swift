//
//  MainTabBarVC.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/18/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarVC: UITabBarController {

//    var gateway = AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: Firestore.firestore())
    var handle : AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
                    self.present(loginVC, animated: true, completion: nil)
                } else {
//                    if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
//                        try! Auth.auth().signOut()
//                    }
                }
                
                
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}
