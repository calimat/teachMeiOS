import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         FirebaseApp.configure()
        let window = UIWindow(frame: UIScreen.main.bounds)
        let fireStore = Firestore.firestore()
        let firebaseDataStoreAdapter = FirebaseDataStoreAdapter(firestore: Firestore.firestore())
        let gateway = AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: fireStore)
        let presenter = ErrorPresenter(error: AuthenticationError(rawvalue: 999))
        let tabbarVC = MainTabBarVC(gateway:gateway, presenter: presenter, dataStore: firebaseDataStoreAdapter )
        self.window = window
        window.rootViewController = tabbarVC
        window.makeKeyAndVisible()
        
        return true
    }

}

