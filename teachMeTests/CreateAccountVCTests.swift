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
    
    func test_HasErrorLbl() {
        XCTAssertNotNil(sut.errorLbl)
        XCTAssertTrue(sut.errorLbl.isHidden)
    }
    
    func test_HasAStudentButton() {
        XCTAssertNotNil(sut.studentBtn)
        XCTAssertTrue(sut.studentBtn.isSelected)
    }
    
    func test_hasATutorButton() {
        XCTAssertNotNil(sut.tutorBtn)
        XCTAssertFalse(sut.tutorBtn.isSelected)
    }
    
    func test_tapsOnTutorBtn_AccountTypeChangesToTutor() {
        guard let tutorBtn = sut.tutorBtn else { XCTFail(); return }
        guard let studentBtn = sut.studentBtn else { XCTFail(); return }
        studentBtn.sendActions(for: .touchUpInside)
        tutorBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.accountType, AccountType.Tutor.rawValue)
        XCTAssertFalse(sut.studentBtn.isSelected)
        XCTAssertTrue(sut.tutorBtn.isSelected)
    }
    
    func tests_tapsOnStudentBtn_AccountTypeChangesToStudent() {
        guard let studentBtn = sut.studentBtn else { XCTFail(); return }
        guard let tutorBtn = sut.tutorBtn else { XCTFail(); return }
        tutorBtn.sendActions(for: .touchUpInside)
        studentBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.accountType, AccountType.Student.rawValue)
        XCTAssertFalse(sut.tutorBtn.isSelected)
        XCTAssertTrue(sut.studentBtn.isSelected)
    }
   
}
