import Firebase


protocol DataStore {
    func getData(for uid: String)
}

class FirebaseDataStore : DataStore {
    private let fireStore: Firestore
    var email:String!
    var accounType: AccountType!
    var firestore: Firestore!
    
    init(fireStore: Firestore) {
        self.fireStore = fireStore
    }
    
    func getData(for uid: String) {
        fireStore.collection("users").document(uid).getDocument { (snapshot, error) in
            guard let documentSnapshot = snapshot else { return }
            guard let data = documentSnapshot.data() else { return }
            self.email = data["email"] as? String
            guard let accountTypeData = data["accountType"] as? String else { return }
            self.accounType = AccountType(rawValue: accountTypeData)
        }
    }
    
    
}
