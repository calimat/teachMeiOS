import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    var gateway: AuthenticationGateway!
    var dataStore: DataStore!
    
    convenience init(gateway:AuthenticationGateway, dataStore:DataStore) {
        self.init()
        self.gateway = gateway
        self.dataStore = dataStore
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutBtn_WasPressed(_ sender: Any) {
        self.gateway.logout()
    }
    
}
