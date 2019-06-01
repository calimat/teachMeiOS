//
//  AppDelegate.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/20/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         FirebaseApp.configure()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarVC = MainTabBarVC(gateway: AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: Firestore.firestore()))
        self.window = window
        window.rootViewController = tabbarVC
        window.makeKeyAndVisible()
        
        return true
    }

}

