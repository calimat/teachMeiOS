protocol AuthenticationGateway {
    func register(email:String, password:String, accountType:String, completion: @escaping (Result<UserEntity,AuthenticationError>) -> Void)
    func login(email:String, password:String, completion: @escaping (Bool, AuthenticationError?) -> Void)
    func logout() 

}

protocol RegisterUserPresenter {
    func success()
    func failure(error: AuthenticationError)
}
