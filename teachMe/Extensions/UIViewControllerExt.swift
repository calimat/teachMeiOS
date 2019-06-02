import UIKit
import Firebase

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func presentMainTabBarController() {
        let mainTabBarVC = MainTabBarVC(gateway: AuthenticationGatewayFirebase(firAuth: Auth.auth(), fireStore: Firestore.firestore()), presenter: ErrorPresenter(error: AuthenticationError(rawvalue: 999)))
        self.present(mainTabBarVC, animated: true, completion: nil)
    }
}
