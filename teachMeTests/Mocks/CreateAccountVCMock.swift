import Foundation
@testable import teachMe
class CreateAccountVCMock: CreateAccountVC {
    var dismissCalled = false
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
    }
}
