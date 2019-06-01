import XCTest
import Firebase
@testable import teachMe

class LoginVCTests: XCTestCase {
    
    var sut : LoginVC!
    var window: UIWindow?
    
    
    override func setUp() {
        super.setUp()
        sut = LoginVC(gateway:firebaseGateWay)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = sut
        window.makeKeyAndVisible()
        _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
    }   

    
    func test_HasUserNameTextField() {
        guard let emailTextField = sut.emailTextField else { XCTFail(); return}
        XCTAssertNotNil(emailTextField)
    }
    
    func test_HasPasswordTextField() {
        guard let passwordTextField = sut.passwordTxtField else { XCTFail(); return }
        XCTAssert(passwordTextField.isSecureTextEntry, "Not secured")
    }
    
    func test_HasloginBtn() {
        guard let loginBtn = sut.loginBtn else { XCTFail(); return }
        XCTAssertNotNil(loginBtn)
    }
    
    func test_HasButtonToPresentCreateAccountVC() {
        guard let createAccountBtn = sut.createAccountBtn else { XCTFail(); return }
        XCTAssertNotNil(createAccountBtn)
    }
    
    func test_userNameTextFieldPlaceHolderTextColor_ShouldBeWhiteChalkColor() {
         guard let usernameTextField = sut.emailTextField else { XCTFail(); return}
        guard let placeHolderColor = usernameTextField.attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { XCTFail(); return }
        XCTAssertEqual(placeHolderColor,  #colorLiteral(red: 1, green: 0.9960784314, blue: 0.9764705882, alpha: 1))
    }
    
    func testUserNameTextFieldPlaceHolder_ShouldsayEmail() {
         guard let usernameTextField = sut.emailTextField else { XCTFail(); return}
        XCTAssertEqual(usernameTextField.placeholder, "email")
    }
    
    func testPasswordTextFieldPlaceHolder_ShouldSayPassword() {
        guard let passwordTextField = sut.passwordTxtField else { XCTFail(); return }
        XCTAssertEqual(passwordTextField.placeholder, "password")
    }
    
    func test_passwordTextFieldPlaceHolderTextColor_ShouldBeWhiteChalkColor() {
        guard let usernameTextField = sut.passwordTxtField else { XCTFail(); return}
        guard let placeHolderColor = usernameTextField.attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { XCTFail(); return }
        XCTAssertEqual(placeHolderColor,  #colorLiteral(red: 1, green: 0.9960784314, blue: 0.9764705882, alpha: 1))
    }
    
    
    func test_emailIsEmptyShouldDisplayEmptyEmailErrorMessage() {
        sut.emailTextField.text = ""
        sut.passwordTxtField.text = "password"
        sut.loginBtn.sendActions(for: .touchUpInside)
        guard let errorLbl = sut.errorLbl else { XCTFail(); return }
        XCTAssertFalse(errorLbl.isHidden)
        XCTAssertEqual(errorLbl.text, EMAIL_EMPTY_MESSAGE)
    }
    
    func test_passwordIsEmptyShouldDisplayEmptyPasswordErrorMessage() {
        sut.emailTextField.text = "rherrera@test.com"
        sut.passwordTxtField.text = ""
        sut.loginBtn.sendActions(for: .touchUpInside)
        guard let errorLbl = sut.errorLbl else { XCTFail(); return }
        XCTAssertFalse(errorLbl.isHidden)
        XCTAssertEqual(errorLbl.text, PASSWORD_EMPTY_MESSAGE)
    }
    
    func test_emailAndPasswordAreNotEmptyErrorLabelShouldbeHidden() {
        sut.emailTextField.text = "rherrera@test.com"
        sut.passwordTxtField.text = "password"
        sut.loginBtn.sendActions(for: .touchUpInside)
        guard let errorLbl = sut.errorLbl else { XCTFail(); return }
        XCTAssertTrue(errorLbl.isHidden)
        XCTAssertEqual(errorLbl.text, "")
    }
    
    func test_gatewayshouldNotBeNil() {
        XCTAssertNotNil(sut.gateway)
    }
    
    
    func test_tappinOnCreateNewAccount_PresentsCreateAccountVC() {
        guard let createAccountBtn = sut.createAccountBtn else {XCTFail(); return}
        createAccountBtn.sendActions(for: .touchUpInside)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is CreateAccountVC)
    }
    
    func test_presentedCreateAccountVC_ShouldnotHaveNilGateway() {
        guard let createAccountBtn = sut.createAccountBtn else {XCTFail(); return}
        createAccountBtn.sendActions(for: .touchUpInside)
        guard let createAccountVC = sut.presentedViewController as? CreateAccountVC else { XCTFail(); return}
        XCTAssertNotNil(createAccountVC.gateway)
    }
}

