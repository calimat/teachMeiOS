//
//  CreateAccountVC.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/5/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit
import Firebase


class CreateAccountVC: UIViewController {

    var accountType:String = AccountType.Student.rawValue
    var createdUserSuccessfully = false
   // var gateway = AuthenticationGatewayFirebase(firAuth: <#T##Auth#>)
    
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func createAccountBtn_WasPressed(_ sender: Any) {
        guard let email = emailTxtField.text , let password = passwordTxtField.text else { return }
//        gateway.register(email: email, password: password, accountType: accountType) { (registerResult) in
//            switch registerResult {
//            case .failure(_):
//                self.createdUserSuccessfully = false
//            case .success(_):
//                self.createdUserSuccessfully = true
//
//            }
//        }
    }
}
