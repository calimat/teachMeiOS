import Foundation
struct RegisterUserUsecase {
    
    private let gateway : AuthenticationGateway
    
    init(gateway: AuthenticationGateway) {
        self.gateway = gateway
    }
    
    func register(email:String, password:String, accountType:String) {
        if email.isEmpty {
            gateway.failure()
        } else {
          gateway.success()
        }
    }
}

