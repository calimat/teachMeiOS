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
        //if FirebaseApp.app() == nil { FirebaseApp.configure() }
        return Firestore.firestore()
    }()
    
    private let validEmail = "studentmaster@test.com"
    private let validPassword = "testing"
    private let invalidPassword = "invalidPassword"
    
    override func setUp() {
        super.setUp()
        self.accountType = AccountType.Student.rawValue
        gateway = AuthenticationGatewayFirebase(firAuth: firAuth, fireStore: fireStore)
    }
    
    
    private func deleteCurrentUser() {
        guard let  firAuthCurrentUser = firAuth.currentUser else { XCTFail("could nod find current user"); return }
        firAuthCurrentUser.delete { XCTAssertNil($0) }
    }
    
    func test_LoginUserWithValidCredetials_ShouldReturnSuccess() {
        let longRunningExpectation = expectation(description: "LoginValidUser")
       
        var loggedIn = false
        gateway.login(email: validEmail, password: validPassword) { (success, error) in
            if success {
                loggedIn = true
                longRunningExpectation.fulfill()
                do {
                    try! self.firAuth.signOut()
                }
            } else {
                XCTFail("Login not successful for email: \(self.validEmail)")
            }
        }
        waitForExpectations(timeout: 20) { (expectationError) in
             XCTAssertNil(expectationError, expectationError!.localizedDescription)
            XCTAssertTrue(loggedIn)
            
        }
        
    }
    
    func test_LoginUserWithInValidPassword_ShouldReturnError() {
        let longRunningExpectation = expectation(description: "LoginInvalidUser")
         var authenticationError: AuthenticationError?
        var loggedIn = false
        gateway.login(email: validEmail, password: invalidPassword) { (success, error) in
            if !success {
                longRunningExpectation.fulfill()
                loggedIn = success
                authenticationError = error
            }
        }
        waitForExpectations(timeout: 20) { (expectationError) in
            XCTAssertNil(expectationError, expectationError!.localizedDescription)
            XCTAssertFalse(loggedIn)
            XCTAssertNotNil(authenticationError)
            
        }
        
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
                    debugPrint(error?.localizedDescription ?? "Unkown Error")
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
