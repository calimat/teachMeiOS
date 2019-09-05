import XCTest
import Firebase
@testable import teachMe

class MainTabBarVCTests: XCTestCase {

    var sut : MainTabBarVC!
    var window: UIWindow?
    
    override func setUp() {
        sut = MainTabBarVC(gateway: firebaseGateWay, presenter: defaultErrorpresenter, dataStore: defaultDataStore)
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
