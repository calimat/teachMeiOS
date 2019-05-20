//
//  ProfileVC.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/12/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutBtn_WasPressed(_ sender: Any) {
        try! Auth.auth().signOut()
    }
    
}
