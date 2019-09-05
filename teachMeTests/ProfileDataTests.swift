//
//  ProfileDataTests.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 6/4/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
import Firebase
@testable import teachMe

class ProfileDataTests: XCTestCase {
    
    private var fireStore: Firestore = {
        if FirebaseApp.app() == nil { FirebaseApp.configure() }
        return Firestore.firestore()
    }()
    
    func test_ReturnsUserProfile() {
        let fetchDataExpectation = expectation(description: "Get Profile Expectation")
        let sut = DataStoreStub(expectation: fetchDataExpectation, firstore: fireStore)
        sut.getData(for: "a68jzr3IsYWi6v4kdthmIpDDAeE2")
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail(error?.localizedDescription ?? "Unkown error")
            } else {
                XCTAssertNotNil(sut.email)
                XCTAssertEqual(sut.email, "studentmaster01@test.com")
                XCTAssertNotNil(sut.accounType)
                XCTAssertEqual(sut.accounType, AccountType.Student)
            }
        }
        
    }
    
}

class DataStoreStub : FirebaseDataStore {
    var expectation:XCTestExpectation!
    var firstore:Firestore!
    init(expectation:XCTestExpectation, firstore:Firestore) {
        super.init(fireStore: firstore)
        self.expectation = expectation
        self.firstore = firstore
    }
    
    override func getData(for uid: String) {
        self.firstore.collection("users").document(uid).getDocument { (snapshot, error) in
            guard let documentSnapshot = snapshot else { return }
            guard let data = documentSnapshot.data() else { return }
            self.email = data["email"] as? String
            guard let accountTypeData = data["accountType"] as? String else { return }
            self.accounType = AccountType(rawValue: accountTypeData)
            self.expectation.fulfill()
            
        }
    }
}


