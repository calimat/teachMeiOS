//
//  ProfileVCTests.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 5/19/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
@testable import teachMe

class ProfileVCTests: XCTestCase {

    var sut : ProfileVC!
    
    override func setUp() {
        super.setUp()
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = mainStoryBoard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        sut.loadView() // This line is the key
        sut.viewDidLoad()
        
    }
    
    func test_HaslogoutBtn() {
        XCTAssertNotNil(sut.logoutBtn)
    }

   

}
