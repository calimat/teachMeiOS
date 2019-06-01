import XCTest
import Firebase
@testable import teachMe

class MainTabBarVCTests: XCTestCase {

    var sut : MainTabBarVC!
    var window: UIWindow?
    private var firAuth: Auth = {
        if FirebaseApp.app() == nil { FirebaseApp.configure() }
        return Auth.auth()
    }()
    private var fireStore: Firestore = {
        if FirebaseApp.app() == nil { FirebaseApp.configure() }
        return Firestore.firestore()
    }()
    
    override func setUp() {
        sut = MainTabBarVC(gateway: AuthenticationGatewayFirebase(firAuth: firAuth, fireStore: fireStore))
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = sut
        window.makeKeyAndVisible()
        _ = sut.view
        
    }

    func test_shouldHaveViewControllers() {
        XCTAssertNotNil(sut.viewControllers)
    }
   
    func test_FirstViewControllerShouldBeProfileVC() {
        XCTAssertTrue(sut.viewControllers?[0] is ProfileVC)
    }
    
    func test_GatewayShouldNotBeNil() {
        XCTAssertNotNil(sut.gateway)
    }

}
