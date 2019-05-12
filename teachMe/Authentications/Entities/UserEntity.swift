protocol User : Equatable {
    var identifier: String? { get }
    var email:String { get }
    var accountType: AccountType { get }
}

struct UserEntity : User {
    var identifier: String?
    let email: String
    let accountType: AccountType
}

