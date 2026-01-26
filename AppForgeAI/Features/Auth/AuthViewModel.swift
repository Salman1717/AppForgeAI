//
//  AuthViewModel.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation
import Combine

@MainActor
final class AuthViewModel: ObservableObject{
    
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?
    
    private let authService: AuthServiceProtocol
    
    init(authService:AuthServiceProtocol){
        self.authService = authService
        
        self.isAuthenticated = authService.currentUserId != nil
    }
    
    func signInWithGoogle() async throws {
        do{
            try await authService.signInWithGoogle()
            isAuthenticated = true
        }catch{
            errorMessage = error.localizedDescription
        }
    }
    
    func signInWithEmailPassword(email: String, password: String) async throws {
        do{
            try await authService.signInWithEmail(email: email, password: password)
            isAuthenticated = true
        }catch{
            errorMessage = error.localizedDescription
        }
    }
    
    func signUpWithEmailPassword(email: String, password: String) async throws{
        do{
            try await authService.signUpWithEmail(email: email, password: password)
            isAuthenticated = true
        }catch{
            errorMessage = error.localizedDescription
        }
    }
    
    func signOut() {
        do {
            try authService.signOut()
            isAuthenticated = false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
