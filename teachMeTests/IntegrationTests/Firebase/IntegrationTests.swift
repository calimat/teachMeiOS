import XCTest
import Firebase
@testable import teachMe

class FirebaseIntegrationTests: XCTestCase {
    
    private var accountType:String!
    private var gateway: AuthenticationGatewayFirebase!
    private var firAuth: Auth = {
        if FirebaseApp.app() == nil { FirebaseApp.configure() }
        return Auth.auth()
    }()
    private var fireStore: Firestore = {
        if FirebaseApp.app() == nil { FirebaseApp.configure() }
        return Firestore.firestore()
    }()
    
    override func setUp() {
        super.setUp()
        self.accountType = AccountType.Student.rawValue
        gateway = AuthenticationGatewayFirebase(firAuth: firAuth, fireStore: fireStore)
    }
    
    
    private func deleteCurrentUser() {
        guard let  firAuthCurrentUser = firAuth.currentUser else { XCTFail("could nod find current user"); return }
        firAuthCurrentUser.delete { XCTAssertNil($0) }

        
    }
    
    func testRegisterNewUserAtFirebaseReturnTheUserTroughtResultHandler() {
        let longRunningExpectation = expectation(description: "RegisterNewUser")
        var authenticationError: AuthenticationError?
        var createdUser: UserEntity?
        let email = "rherrera13@test.com"
        
        gateway.register(email: email, password: "password", accountType: AccountType.Student.rawValue) { result in
            switch result {
            case let .success(user): createdUser = user ;
            case let .failure(error): authenticationError = error
            }
    self.fireStore.collection("users").document(self.firAuth.currentUser!.uid).delete()
            self.firAuth.currentUser?.delete(completion: { (error) in
                if error == nil {
                    debugPrint("no error")
                    
                    longRunningExpectation.fulfill()
                } else {
                    debugPrint(error?.localizedDescription)
                }
            })
        }
        
        waitForExpectations(timeout: 20) { expectationError in
            XCTAssertNil(expectationError, expectationError!.localizedDescription)
            XCTAssertNil(authenticationError)
            XCTAssertNotNil(createdUser)
            XCTAssertEqual(email, createdUser?.email)
            XCTAssertEqual(self.accountType, createdUser?.accountType)

        }
        
    }
}
