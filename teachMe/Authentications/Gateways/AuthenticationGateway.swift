protocol AuthenticationGateway {
    func register(email:String, password:String, accountType:AccountType)
    func failure()
    func success()
}

enum AccountType {
    case Student
}
