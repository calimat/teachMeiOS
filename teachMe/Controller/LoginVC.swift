import UIKit
import Firebase


class LoginVC: UIViewController {

    var gateway:AuthenticationGateway!
    var presenter: Presenter!
    var dataStore: DataStore!
    
    @IBOutlet weak var emailTextField: ChalkBoardTextField!
    @IBOutlet weak var passwordTxtField: ChalkBoardTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        spinner.isHidden = true
        spinner.hidesWhenStopped = true
    }
    
    convenience init(gateway:AuthenticationGateway, presenter: Presenter, dataStore: DataStore) {
        self.init()
        self.gateway = gateway
        self.presenter = presenter
        self.dataStore = dataStore
   
    }
    
    @IBAction func createAccountBtn_Pressed(_ sender: Any) {
        let accountVC = CreateAccountVC(gateway: gateway, presenter: presenter)
        self.present(accountVC, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn_Pressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        errorLbl.isHidden = false
        validadeInputs()
        gateway.login(email: emailTextField.text!, password: passwordTxtField.text!) { (success, error) in
            self.spinner.stopAnimating()
            if let authError = error {
                self.errorLbl.isHidden = false
                self.errorLbl.text = self.presenter.displayMessage(for: authError)
            } else {
                self.presentMainTabBarController(gateway: self.gateway, presenter: self.presenter, dataStore: self.dataStore)
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

