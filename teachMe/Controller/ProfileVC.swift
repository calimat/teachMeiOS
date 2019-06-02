import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    var gateway: AuthenticationGateway!
    
    convenience init(gateway:AuthenticationGateway) {
        self.init()
        self.gateway = gateway
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutBtn_WasPressed(_ sender: Any) {
        self.gateway.logout()
    }
    
}
