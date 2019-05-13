import Foundation

struct RegisterUserUsecase {
    
    private let gateway : AuthenticationGateway
    private let presenter: RegisterUserPresenter
    
    init(gateway: AuthenticationGateway, presenter: RegisterUserPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func register(email:String, password:String, accountType:String) {
        gateway.register(email: email, password: password, accountType: accountType, completion: presentResult)
    }
    
    private func presentResult(result: Result<UserEntity, AuthenticationError>) {
        switch result {
        case .success: self.presenter.success()
        case .failure(_): self.presenter.failure(error: AuthenticationError(rawvalue: 99989))
        }
    }

}


