//
//  ViewController.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/20/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        setupLoginBtn()
    }

    
    private func setupLoginBtn() {
        if(!(usernameTxtField.text?.isEmpty)! && !(passwordTxtField.text?.isEmpty)!) {
            loginBtn.isEnabled = true
        } else {
            loginBtn.isEnabled = false
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        usernameTxtField.resignFirstResponder()
        passwordTxtField.resignFirstResponder()
    }
    
    
    @IBAction func logintBtn_pressed(_ sender: Any) {
        
    }
    
    
    @IBAction func userNametextFieldEndEditing(_ sender: Any) {
       setupLoginBtn()
    }
    
    @IBAction func passwordTxtFieldEndEditing(_ sender: Any) {
        setupLoginBtn()
    }
    
    

}

