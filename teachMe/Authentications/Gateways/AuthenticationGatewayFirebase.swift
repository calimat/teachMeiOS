import Foundation
import Firebase

struct AuthenticationGatewayFirebase : AuthenticationGateway {
    
    private let firAuth: Auth
    private let fireStore: Firestore
    
    init(firAuth: Auth, fireStore: Firestore) {
       // FirebaseApp.configure()
        self.firAuth = firAuth
        self.fireStore = fireStore
    }
    
    typealias RegisterResult = Result<UserEntity, AuthenticationError>
    func register(email: String, password: String, accountType: String, completion: @escaping (Result<UserEntity, AuthenticationError>) -> Void) {
        firAuth.createUser(withEmail: email, password: password) { (authData, error) in
            if let authError = error {
                let result = RegisterResult.failure(AuthenticationError(rawvalue: authError._code))
                completion(result)
                return
            }
            
            if let authData = authData {
                self.createUser(authData: authData, email: email, accountType: accountType, completion: completion)
                
                
            }
            
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool, AuthenticationError?) -> Void) {
        firAuth.signIn(withEmail: email, password: password) { (authResult, error) in
            if let authError = error {
                completion(false,AuthenticationError(rawvalue: authError._code))
            } else {
                debugPrint(authResult)
                debugPrint(error)
                completion(true,nil)
            }
        }
    }
    
//    func login(email:String, password: String, completion: @escaping (_ success:Bool)->()) {
//       firAuth.signIn(withEmail: email, password: password) { (authData, error) in
//            if error == nil {
//                completion(true)
//            } else {
//                completion(false)
//            }
//        }
//    }
    
    private func createUser(authData: AuthDataResult?, email: String, accountType:String,
                            completion: @escaping ((Result<UserEntity, AuthenticationError>) -> Void)) {
        guard let user = authData?.user else { return }
        // let reference = Database.database().reference()
        let userDicitonary = self.generateDictionary(email: email, accountType: accountType)
        fireStore.collection("users").document(user.uid).setData(userDicitonary) { _ in
            let user = self.generateUserEntity(identifier: user.uid, email: email, accountType: accountType)
            let result = RegisterResult.success(user)
            completion(result)
        }
        
    }
    
    private func generateDictionary(email: String, accountType: String) -> [String: Any] {
        return ["email": email, "accountType": AccountType.Student.rawValue]
    }
    
    private func generateUserEntity(identifier: String, email: String, accountType: String) -> UserEntity {
        return UserEntity(identifier: identifier, email: email, accountType: accountType)
    }
    
    
    
    
    
}

