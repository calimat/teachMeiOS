import UIKit
import Firebase

class MainTabBarVC: UITabBarController {

    var handle : AuthStateDidChangeListenerHandle?
    var gateway: AuthenticationGateway!
    var presenter: Presenter!
    var dataStore: DataStore!
    
    convenience init(gateway:AuthenticationGateway, presenter: Presenter, dataStore:DataStore) {
        self.init()
        self.gateway = gateway
        self.presenter = presenter
        self.dataStore = dataStore
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let profileVC = ProfileVC(gateway: gateway,dataStore:dataStore )
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)
        self.viewControllers = [profileVC]
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil {
                let loginVC = LoginVC(gateway: self.gateway, presenter: self.presenter, dataStore: self.dataStore)
                    self.present(loginVC, animated: true, completion: nil)
                
                
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let profileVC = ProfileVC()
//        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        // Do any additional setup after loading the view.
    }
    

}
