 import Firebase
 @testable import teachMe
private var firAuth2: Auth = {
    if FirebaseApp.app() == nil { FirebaseApp.configure() }
    return Auth.auth()
 }()
private var fireStore2: Firestore = {
    if FirebaseApp.app() == nil { FirebaseApp.configure() }
    return Firestore.firestore()
 }()

  var firebaseGateWay: AuthenticationGatewayFirebase = {
    return AuthenticationGatewayFirebase(firAuth: firAuth2, fireStore: fireStore2)
 }()
