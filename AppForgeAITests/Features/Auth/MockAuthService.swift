//
//  MockAuthService.swift
//  AppForgeAITests
//
//  Created by Salman Mhaskar on 26/01/26.
//

import Foundation
@testable import AppForgeAI

final class MockAuthService: AuthServiceProtocol {
    
    var shouldFail =  false
    var errorToThrow: AuthError?
    
    private(set) var fakeUserId: String?
    
    func signInWithGoogle() async throws {
        if shouldFail{
            throw errorToThrow ?? .unknown
        }
        
        fakeUserId = "test_uid"
    }
    
    func signInWithEmail(email: String, password: String) async throws {
        if shouldFail{
            throw errorToThrow ?? .invalidCredentials
        }
        fakeUserId = "test_uid"
    }
    
    func signUpWithEmail(email: String, password: String) async throws {
        if shouldFail{
            throw errorToThrow ?? .emailAlreadyInUse
        }
        fakeUserId = "test_uid"
        
    }
    
    func signOut() throws {
        fakeUserId = nil
    }
    
    var currentUserId: String?{
        fakeUserId
    }
    
}
