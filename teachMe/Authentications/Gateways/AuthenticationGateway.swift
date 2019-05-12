protocol AuthenticationGateway {
    func register(email:String, password:String, accountType:AccountType, completion: @escaping (Result<UserEntity,AuthenticationError>) -> Void)
    func failure()
    func success()
}
