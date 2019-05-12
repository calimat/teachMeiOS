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
    func testRegisterAStudentUserWithEmptyEmail_ReturnsANilregisteredUser() {
        let gateway = AuthenticationGatewayStub()
        let usecase = RegisterUserUsecase(gateway: gateway)
        usecase.register(email: "", password:"password", accountType:"Student")
        XCTAssertNil(gateway.registeredUser)
    }
    
    func testRegisterAStundentUserWithValidInput_RegisteredUserIsNotNil() {
        let gateway = AuthenticationGatewayStub()
        let usecase = RegisterUserUsecase(gateway: gateway)
        usecase.register(email: "rherrera@test.com", password: "password", accountType: "Student")
        XCTAssertNotNil(gateway.registeredUser)
    }
    
    func testRegisterAStudentWithValidImput_RegisteredUserShouldBeTheSameAsAgteway() {
        let gateway = AuthenticationGatewayStub()
        let usecase = RegisterUserUsecase(gateway: gateway)
        let user = UserEntity(identifier:"dummyId", email: "rherrera@test.com", accountType: "Student")
        usecase.register(email: "rherrera@test.com", password: "password", accountType: "Student")
        XCTAssertEqual(gateway.registeredUser!, user)
    }
}
