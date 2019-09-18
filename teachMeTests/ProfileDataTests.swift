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
    
    func test_ReturnProfile() {
        let fetchExp = expectation(description: "Get Profile Exp")
        let sut = FirebaseDataStoreAdapter(firestore: fireStore)
        let adapterSpy = FirebaseAdapterSpy(firestore: fireStore)
        sut.getData(for: "a68jzr3IsYWi6v4kdthmIpDDAeE2") { (snapshot, error) in
            guard let documentSnapshot = snapshot else { return }
            guard let data = documentSnapshot.data() else { return }
            adapterSpy.email = data["email"] as? String
            guard let accountTypeData = data["accountType"] as? String else { return }
            adapterSpy.accounType = AccountType(rawValue: accountTypeData)
            fetchExp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if error != nil {
                XCTFail(error?.localizedDescription ?? "Unkown error")
            } else {
                XCTAssertNotNil(adapterSpy.email)
                XCTAssertEqual(adapterSpy.email, "studentmaster01@test.com")
                XCTAssertNotNil(adapterSpy.accounType)
                XCTAssertEqual(adapterSpy.accounType, AccountType.Student)
            }
        }
    }
    
    
    class FirebaseAdapterSpy: FirebaseDataStoreAdapter {
        var email:String!
        var accounType: AccountType!
    }

}

