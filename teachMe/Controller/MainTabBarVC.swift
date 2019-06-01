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

    var handle : AuthStateDidChangeListenerHandle?
    var gateway: AuthenticationGateway!
    
    convenience init(gateway:AuthenticationGateway) {
        self.init()
        self.gateway = gateway
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if gateway == nil {
            self.gateway = AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: Firestore.firestore())
        }
        let profileVC = ProfileVC(gateway: gateway)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)
        self.viewControllers = [profileVC]
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
             let loginVC = LoginVC(gateway: self.gateway)
                    self.present(loginVC, animated: true, completion: nil)
                
                
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let profileVC = ProfileVC()
//        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        // Do any additional setup after loading the view.
    }
    

}
