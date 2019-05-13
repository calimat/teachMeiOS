import XCTest
@testable import teachMe

class CreateAccountVCTests : XCTestCase {
    var sut : CreateAccountVC!
    var gateway: AuthenticationGatewayFirebase!
    
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
    
    func test_RegisterAStudentAccount() {
        let longRunningExpectation = expectation(description: "RegisterUserWithAlreadyInUseEmail")
        // ...
        gateway.register(email: "rherrera1@test.com", password: "passsowrd", accountType: .Student) { (result) in
            longRunningExpectation.fulfill()
        }
        waitForExpectations(timeout: 10) { expectationError in
            // Expect the error for wainting is nil
            XCTAssertNil(expectationError, expectationError!.localizedDescription)
            // ...
        }
    }
    
//    func test_RegisterAStudentAccount() {
//        sut.emailTxtField.text = "rherrera1@test.com"
//        sut.passwordTxtField.text = "password"
//        XCTAssertTrue(sut.createdUserSuccessfully)
//    }
   
}
