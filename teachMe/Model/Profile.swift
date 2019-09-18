import Firebase


protocol DataStore {
    func getData(for uid: String, completion: @escaping (DocumentSnapshot?, Error?) -> ())
}

public class FirebaseDataStoreAdapter : DataStore {
    var firestore: Firestore!
    
    init(firestore:Firestore) {
        self.firestore = firestore
    }
    
    func getData(for uid: String, completion: @escaping (DocumentSnapshot?, Error?) -> ()) {
        firestore.collection("users").document(uid).getDocument { (snapshot, error) in
            completion(snapshot,error)
        }
    }
    
}

