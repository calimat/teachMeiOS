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
    
    var gateway = AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: Firestore.firestore())
    
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var errorLbl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func createAccountBtn_WasPressed(_ sender: Any) {
        var authenticationError: AuthenticationError?
        guard let email = emailTxtField.text , let password = passwordTxtField.text else { return }
        self.gateway.register(email: email, password: password, accountType: accountType) { (result) in
            switch result {
            case .success(_) :
                guard let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarVC") as? MainTabBarVC else { return }
                self.present(profileVC, animated: true, completion: nil)
                break
            case .failure(let error): authenticationError = error
            self.errorLbl.isHidden = false
            self.errorLbl.text = String(describing:error)
                break
            }
        }
        
    }
}
