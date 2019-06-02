//
//  ViewController.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/20/18.
//  Copyright © 2018 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import Firebase


class LoginVC: UIViewController {

    var gateway:AuthenticationGateway!
    var presenter: Presenter!
    
    @IBOutlet weak var emailTextField: ChalkBoardTextField!
    @IBOutlet weak var passwordTxtField: ChalkBoardTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    convenience init(gateway:AuthenticationGateway, presenter: Presenter) {
        self.init()
        self.gateway = gateway
        self.presenter = presenter
   
    }
    
    @IBAction func createAccountBtn_Pressed(_ sender: Any) {
        let accountVC = CreateAccountVC(gateway: gateway, presenter: presenter)
        self.present(accountVC, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn_Pressed(_ sender: Any) {
        errorLbl.isHidden = false
        validadeInputs()
        gateway.login(email: emailTextField.text!, password: passwordTxtField.text!) { (success, error) in
            if let authError = error {
                self.errorLbl.isHidden = false
                self.errorLbl.text = self.presenter.displayMessage(for: authError)
            } else {
                self.presentMainTabBarController(gateway: self.gateway, presenter: self.presenter)
            }
        }
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

