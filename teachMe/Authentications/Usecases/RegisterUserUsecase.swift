import Foundation
struct RegisterUserUsecase {
    
    private let gateway : AuthenticationGateway
    
    init(gateway: AuthenticationGateway) {
        self.gateway = gateway
    }
    
    func register(email:String, password:String, accountType:AccountType) {
       gateway.register(email: email, password: password, accountType: accountType)
    }
}

