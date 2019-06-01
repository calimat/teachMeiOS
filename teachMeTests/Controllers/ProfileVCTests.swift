import XCTest
import Firebase
@testable import teachMe

class ProfileVCTests: XCTestCase {

    var sut : ProfileVC!
    var window: UIWindow?
    
    override func setUp() {
        super.setUp()
        sut = ProfileVC(gateway:firebaseGateWay)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = sut
        window.makeKeyAndVisible()
        _ = sut.view
    }
    
    func test_HaslogoutBtn() {
        XCTAssertNotNil(sut.logoutBtn)
    }

    func test_LogoutBtn_ShouldSayLogout() {
        XCTAssertEqual(sut.logoutBtn.titleLabel?.text,
                       "Logout")
    }
    
    func test_GatewayShouldNoTBeNil() {
        XCTAssertNotNil(sut.gateway)
    }

}
