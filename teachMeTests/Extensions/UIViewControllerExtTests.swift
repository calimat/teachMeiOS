import UIKit
import XCTest
@testable import teachMe 

class UIViewControllerExtTests: XCTestCase {
    
    var window: UIWindow?
    var sut : MockViewController!
    
    override func setUp() {
        sut = MockViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = sut
        window.makeKeyAndVisible()
        _ = sut.view
    }
    
    func test_ViewControllerShouldPresent_MainTabBarVC () {
        sut.presentMainTabBarController(gateway: firebaseGateWay, presenter: defaultErrorpresenter)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is MainTabBarVC)
    }
    
    
    
}
