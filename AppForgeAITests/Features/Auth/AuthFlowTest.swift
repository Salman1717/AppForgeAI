//
//  AuthFlowTest.swift
//  AppForgeAITests
//
//  Created by Salman Mhaskar on 26/01/26.
//

import XCTest
@testable import AppForgeAI

@MainActor
final class AuthFlowTest: XCTestCase {
    
    private var mockService : MockAuthService!
    private var viewModel: AuthViewModel!
    
    // MARK:  -  Setup
    
    override func setUp()  {
        super.setUp()
        
        mockService = MockAuthService()
        
        viewModel = AuthViewModel(authService: mockService)
    }
    
    override func tearDown(){
        mockService = nil
        viewModel = nil
        super.tearDown()
    }
    
    //MARK: - Initial State
    func testInitialState(){
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    //MARK: - Google Sign In
    func testGoogleSignInSuccess() async throws{
        try await viewModel.signInWithGoogle()
        
        XCTAssertTrue(viewModel.isAuthenticated)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(mockService.currentUserId, "test_uid")
    }
    
    func testGoogleSignInCancelled() async throws{
        mockService.shouldFail = true
        mockService.errorToThrow = .userCancelled
        
        try await viewModel.signInWithGoogle()
        
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertEqual(viewModel.errorMessage, AuthError.userCancelled.localizedDescription)
    }
    
    // MARK: - Email Sign In
    func testEmailSignInSuccess() async throws{
        
        try await viewModel.signInWithEmailPassword(email: "test@test.com", password: "appforgeai")
        
        XCTAssertTrue(viewModel.isAuthenticated)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testEmailSignInWrongPass() async throws{
        mockService.shouldFail = true
        mockService.errorToThrow = .invalidCredentials
        
        try await viewModel.signInWithEmailPassword(email: "test@test.com", password: "wrong")
        
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertEqual(viewModel.errorMessage, AuthError.invalidCredentials.localizedDescription)
    }
    
    //MARK: - Email Sign Up
    func testSignUpSuccess() async throws{
        try await viewModel.signUpWithEmailPassword(email: "new@test.com", password: "12345678")
        
        XCTAssertTrue(viewModel.isAuthenticated)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    func testSignUpEmailAlreadyExists() async throws{
        mockService.shouldFail = true
        mockService.errorToThrow = .emailAlreadyInUse
        
        try await viewModel.signUpWithEmailPassword(email: "new@test.com", password: "12345678")
        
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertEqual(viewModel.errorMessage, AuthError.emailAlreadyInUse.localizedDescription)
    }
    
    //MARK: - Log Out Clear Session
    func testLogOutClearSession() async throws{
        viewModel.isAuthenticated = true
        
         viewModel.signOut()
        
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertNil(mockService.currentUserId)
    }
    
    //MARK: - Network Error
    func testNetworkError() async throws{
        mockService.shouldFail = true
        mockService.errorToThrow = .networkFailure
        
        
        try await viewModel.signInWithGoogle()
        
        
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertEqual(viewModel.errorMessage,AuthError.networkFailure.localizedDescription)
    }
    
    //MARK: - Unknown Error
    func testUnknownError() async throws{
        mockService.shouldFail = true
        mockService.errorToThrow = .unknown
        
        
        try await viewModel.signInWithGoogle()
        
        
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertEqual(viewModel.errorMessage, AuthError.unknown.localizedDescription)
    }
}
