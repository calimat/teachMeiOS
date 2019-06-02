class ErrorPresenter:Presenter {
    init(error:AuthenticationError) {
        self.error = error
    }
    var error:AuthenticationError
    
    func displayMessage(for error:AuthenticationError) -> String {
        
        switch error {
        case .userDisabled:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        case .emailAlreadyInUse:
            return EMAIL_ALREADYINUSE_MESSAGE
        case .invalidEmail:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        case .wrongPassword:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        case .userNotFound:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        case .accountExistsWithDifferentCredential:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        case .networkError:
            return NETWORK_ERRORMESSAGE
        case .credentialAlreadyInUse:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        case .invalidPassword:
            return INVALID_EMAIL_OR_PASSWORD_MESSAGE
        default:
            return UNKNOWN_ERRORMESSAGE
        }

    }
}
