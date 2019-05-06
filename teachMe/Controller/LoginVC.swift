//
//  ViewController.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/20/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var usernameTxtField: ChalkBoardTextField!
    @IBOutlet weak var passwordTxtField: ChalkBoardTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        guard let username = usernameTxtField.text, let password = passwordTxtField.text else { return }
        AuthService.instance.login(withEmail: username, andPassword: password) { (success, serviceError) in
            if serviceError != nil {
                self.errorLbl.isHidden = false
                self.errorLbl.text = serviceError?.localizedDescription
            }
        }
    }
    
    
}

