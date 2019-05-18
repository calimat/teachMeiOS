import XCTest
@testable import teachMe

class CreateAccountVCTests : XCTestCase {
    var sut : CreateAccountVC!
   // var gateway: AuthenticationGatewayFirebase!
    
    private let userEmail = "fake@gmail.com"
    private let accountType = AccountType.Student.rawValue
    
    override func setUp() {
        super.setUp()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStoryBoard.instantiateViewController(withIdentifier: "CreateAccountVC") as? CreateAccountVC
        sut.loadView() // This line is the key
        sut.viewDidLoad()
       // self.gateway = AuthenticationGatewayFirebase(firAuth: <#T##Auth#>)
        
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
    
    
   

}
