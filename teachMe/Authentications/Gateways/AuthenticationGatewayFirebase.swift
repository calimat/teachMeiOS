import Foundation
import Firebase

struct AuthenticationGatewayFirebase : AuthenticationGateway {
    typealias RegisterResult = Result<UserEntity, AuthenticationError>
    func register(email: String, password: String, accountType: AccountType, completion: @escaping (Result<UserEntity, AuthenticationError>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
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

    private func createUser(authData: AuthDataResult?, email: String, accountType:AccountType,
                            completion: @escaping ((Result<UserEntity, AuthenticationError>) -> Void)) {
        guard let user = authData?.user else { return }
        let reference = Database.database().reference()
        let userReference =  reference.child("users").child(user.uid)
        let userDicitonary = self.generateDictionary(email: email, accountType: accountType)
        
        userReference.updateChildValues(userDicitonary) { _, _ in
            let result = RegisterResult.success(self.generateUserEntity(identifier: user.uid, email: email, accountType: accountType))
            completion(result)
        }
        
    }

    private func generateDictionary(email: String, accountType: AccountType) -> [String: Any] {
        return ["email": email, "accountType": AccountType.Student]
    }
    
    private func generateUserEntity(identifier: String, email: String, accountType: AccountType) -> UserEntity {
        return UserEntity(identifier: identifier, email: email, accountType: accountType)
    }
    
    func failure() {
        //
    }

    func success() {
        //
    }


}

