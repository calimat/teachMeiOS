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
 
 var defaultErrorpresenter: ErrorPresenter = {
    return ErrorPresenter(error: AuthenticationError(rawvalue: 999))
 }()

 var defaultDataStore: DataStore = {
    return FirebaseDataStoreAdapter(firestore: fireStore)
 }()
