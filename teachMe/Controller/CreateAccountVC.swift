import UIKit
import Firebase


class CreateAccountVC: UIViewController {
    
    var accountType:String = AccountType.Student.rawValue
    
    var gateway: AuthenticationGateway!
    var presenter: Presenter!
    var dataStore: DataStore!
    
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var errorLbl:UILabel!
    @IBOutlet weak var studentBtn: UIButton!
    @IBOutlet weak var tutorBtn:UIButton!
    @IBOutlet weak var backBtn:UIButton!
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        spinner.isHidden = true
        spinner.hidesWhenStopped = true 
    }
    
    convenience init(gateway: AuthenticationGateway, presenter: Presenter) {
        self.init()
        self.gateway = gateway
        self.presenter = presenter
        
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
    
    fileprivate func displayError(_ authError: AuthenticationError) {
        self.errorLbl.isHidden = false
        self.errorLbl.text = self.presenter.displayMessage(for: authError)
    }
    
    @IBAction func createAccountBtn_WasPressed(_ sender: Any) {
        guard let email = emailTxtField.text , let password = passwordTxtField.text else { return }
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        self.gateway.register(email: email, password: password, accountType: accountType) { (result) in
            switch result {
            case .success(_) :
                self.gateway.login(email: email, password: password, completion: { (success, error) in
                    self.spinner.stopAnimating()
                    if let authError = error {
                        self.displayError(authError)
                    } else {
                        self.presentMainTabBarController(gateway: self.gateway, presenter: self.presenter, dataStore: self.dataStore )
                    }
                })
                break
            case .failure(let error):
                self.spinner.stopAnimating()
                self.displayError(error)
                break
            }
        }
        
    }
}
