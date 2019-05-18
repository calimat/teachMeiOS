protocol AuthenticationGateway {
    func register(email:String, password:String, accountType:String, completion: @escaping (Result<UserEntity,AuthenticationError>) -> Void)
}

protocol RegisterUserPresenter {
    func success()
    func failure(error: AuthenticationError)
}
