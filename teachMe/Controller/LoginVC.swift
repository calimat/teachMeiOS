//
//  ViewController.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/20/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {

   
    
    @IBOutlet weak var emailTextField: ChalkBoardTextField!
    @IBOutlet weak var passwordTxtField: ChalkBoardTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func loginBtn_Pressed(_ sender: Any) {
        errorLbl.isHidden = false
        validadeInputs()
        
    }
    
    func validadeInputs() {
        guard let email = emailTextField.text, let password = passwordTxtField.text  else { return }
        
        if !email.isEmpty && !password.isEmpty {
            errorLbl.isHidden = true
            errorLbl.text = ""
        }
        
        if email.isEmpty {
            errorLbl.text = EMAIL_EMPTY_MESSAGE
        }
        
        if password.isEmpty {
            errorLbl.text = PASSWORD_EMPTY_MESSAGE
        }
    }
    
}

