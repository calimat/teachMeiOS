//
//  RegisterUserUseCaseTest.swift
//  teachMeTests
//
//  Created by Ricardo Herrera Petit on 5/11/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
@testable import teachMe

class RegisteruserUseCaseTests : XCTestCase {
    
    private var gateway:AuthenticationGatewayStub!
    private var presenter:RegisterUserPresenterStub!
    private var usecase:RegisterUserUsecase!
    
    override func setUp() {
        gateway = AuthenticationGatewayStub()
        presenter = RegisterUserPresenterStub()
        usecase = RegisterUserUsecase(gateway: gateway,presenter: presenter)
    }
    
    func testRegisterAStudentUserWithEmptyEmail_ReturnsANilregisteredUser() {
        usecase.register(email: "", password:"password", accountType:AccountType.Student.rawValue)
        XCTAssertNil(gateway.registeredUser)
    }
    
    func testRegisterAStundentUserWithValidInput_RegisteredUserIsNotNil() {
        let user = UserEntity(identifier:"dummyId", email: "rherrera@test.com", accountType: AccountType.Student.rawValue)
        gateway.registerResult = Result.success(user)
        usecase.register(email: "rherrera@test.com", password: "password", accountType: AccountType.Student.rawValue)
        XCTAssertNotNil(gateway.registeredUser)
    }
    
    func testRegisterAStudentWithValidImput_RegisteredUserShouldBeTheSameAsAgateway() {
        let user = UserEntity(identifier:nil, email: "rherrera@test.com", accountType: AccountType.Student.rawValue)
        gateway.registerResult = Result.success(user)
        usecase.register(email: "rherrera@test.com", password: "password", accountType: AccountType.Student.rawValue)
        XCTAssertEqual(gateway.registeredUser!, user)
    }
}
