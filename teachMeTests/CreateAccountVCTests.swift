import XCTest
@testable import teachMe

class CreateAccountVCTests : XCTestCase {
    var sut : CreateAccountVC!
    var gateway: AuthenticationGatewayFirebase!
    
    private let userEmail = "fake@gmail.com"
    private let accountType = AccountType.Student.rawValue
    
    override func setUp() {
        super.setUp()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStoryBoard.instantiateViewController(withIdentifier: "CreateAccountVC") as? CreateAccountVC
        sut.loadView() // This line is the key
        sut.viewDidLoad()
        self.gateway = AuthenticationGatewayFirebase()
        
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_HasACreateAccountBtn() {
        XCTAssertNotNil(sut.createAccountBtn)
    }
    
    func test_HasEmailTxtField() {
        XCTAssertNotNil(sut.emailTxtField)
    }
    
    func test_HasPasswordTxtField() {
        XCTAssertNotNil(sut.passwordTxtField)
    }
    
    func test_HasAccountTypeVariable() {
        XCTAssertNotNil(sut.accountType)
    }
    
    func test_HasGateway() {
        XCTAssertNotNil(sut.gateway)
    }
    
    func testRegisterNewUserAtFirebaseReturnTheUserTroughtResultHandler() {
        let longRunningExpectation = expectation(description: "RegisterNewUser")
        var authenticationError: AuthenticationError?
        var createdUser: UserEntity?
        let email = "rherrera10@test.com"

        gateway.register(email: "rherrera10@test.com", password: "password", accountType: AccountType.Student.rawValue) { result in
            switch result {
            case let .success(user): createdUser = user
            case let .failure(error): authenticationError = error
            }
            longRunningExpectation.fulfill()
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
    
//    func test_RegisterAStudentAccount() {
//        sut.emailTxtField.text = "rherrera1@test.com"
//        sut.passwordTxtField.text = "password"
//        XCTAssertTrue(sut.createdUserSuccessfully)
//    }
   

