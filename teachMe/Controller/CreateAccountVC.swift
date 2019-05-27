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
    
    var gateway = AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: Firestore.firestore())
    
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var errorLbl:UILabel!
    @IBOutlet weak var studentBtn: UIButton!
    @IBOutlet weak var tutorBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func studentBtn_WasPressed(_ sender: Any) {
        accountType = AccountType.Student.rawValue
        studentBtn.isSelected = true
        tutorBtn.isSelected = false
        
    }
    
    @IBAction func tutorBtn_WasPressed(_ sender: Any) {
        accountType = AccountType.Tutor.rawValue
        studentBtn.isSelected = false
        tutorBtn.isSelected = true
    }
    
    fileprivate func displayMessage(for error: (AuthenticationError)) {
        self.errorLbl.isHidden = false
        self.errorLbl.text = String(describing:error)
    }
    
    func presentMainTabBarVC() {
        guard let mainTabBarVC = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarVC") as? MainTabBarVC else { return }
        self.present(mainTabBarVC, animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtn_WasPressed(_ sender: Any) {
        guard let email = emailTxtField.text , let password = passwordTxtField.text else { return }
        
        self.gateway.register(email: email, password: password, accountType: accountType) { (result) in
            switch result {
            case .success(_) :
                self.gateway.login(email: email, password: password, completion: { (success, error) in
                    if let authError = error {
                        self.displayMessage(for: authError)
                    } else {
                        self.presentMainTabBarVC()                    }
                })
                break
            case .failure(let error):
                self.displayMessage(for: error)
                break
            }
        }
        
    }
}
