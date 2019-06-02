import XCTest
@testable import teachMe

class ErrorPresenterTests: XCTestCase {
    
    func test_HasAnAuthenticationError() {
        let error = AuthenticationError(rawvalue: 0)
        let sut = ErrorPresenter(error: error)
        XCTAssertNotNil(sut.error)
    }
    
    func test_DisplayMessageFor17005ShouldSay_ErrorInUserDisabled() {
        let error = AuthenticationError(rawvalue: 17005)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor17007ShouldSay_ErrorEmailInUse() {
        let error = AuthenticationError(rawvalue: 17007)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), EMAIL_ALREADYINUSE_MESSAGE)
    }
    
    func test_DisplayMessageFor17008ShouldSay_InvalidUsernameOrPassword() {
        let error = AuthenticationError(rawvalue: 17008)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor17009ShouldSay_InvalidUsernameOrPassword() {
        let error = AuthenticationError(rawvalue: 17009)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor17011ShouldSay_InvalidUsernameOrPassword() {
        let error = AuthenticationError(rawvalue: 17011)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor17012ShouldSay_InvalidUsernameOrPassword() {
        let error = AuthenticationError(rawvalue: 17012)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor17020ShouldSay_NetworkError() {
        let error = AuthenticationError(rawvalue: 17020)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), NETWORK_ERRORMESSAGE)
    }
    
    func test_DisplayMessageFor17025ShouldSay_InvalidUsernameOrPasswor() {
        let error = AuthenticationError(rawvalue: 17025)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor17026ShouldSay_InvalidUsernameOrPasswor() {
        let error = AuthenticationError(rawvalue: 17026)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), INVALID_EMAIL_OR_PASSWORD_MESSAGE)
    }
    
    func test_DisplayMessageFor999ShouldSay_InvalidUsernameOrPasswor() {
        let error = AuthenticationError(rawvalue: 999)
        let sut = ErrorPresenter(error: error)
        XCTAssertEqual(sut.displayMessage(for: error), UNKNOWN_ERRORMESSAGE)
    }

}
