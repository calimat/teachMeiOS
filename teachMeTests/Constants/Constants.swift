 import Firebase
 @testable import teachMe
 private var firAuth: Auth = {
    if FirebaseApp.app() == nil { FirebaseApp.configure() }
    return Auth.auth()
 }()
 private var fireStore: Firestore = {
    if FirebaseApp.app() == nil { FirebaseApp.configure() }
    return Firestore.firestore()
 }()
 
 var firebaseGateWay: AuthenticationGatewayFirebase = {
    return AuthenticationGatewayFirebase(firAuth: firAuth, fireStore: fireStore)
 }()
