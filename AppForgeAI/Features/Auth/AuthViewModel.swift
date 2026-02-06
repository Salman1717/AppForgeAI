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
    
    private let authService: AuthServiceProtocol
    
    let userName: String
    
    init(authService:AuthServiceProtocol){
        self.authService = authService
        
        self.isAuthenticated = authService.currentUserId != nil
        
        self.userName = authService.currentUserName ?? "Anonymous"  
        
    }
    
    // MARK: - Google
    func signInWithGoogle() async throws {
        do{
            try await authService.signInWithGoogle()
            isAuthenticated = true
        }catch{
            if let authError = error as? AuthError {
                SnackbarManager.shared.show(authError.localizedDescription)
            } else {
                SnackbarManager.shared.show(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Sign In With Email Pass
    func signInWithEmailPassword(email: String, password: String) async throws {
        do{
            try await authService.signInWithEmail(email: email, password: password)
            isAuthenticated = true
        }catch{
            if let authError = error as? AuthError {
                SnackbarManager.shared.show(authError.localizedDescription)
            } else {
                SnackbarManager.shared.show(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Sign Up with Email Pass
    func signUpWithEmailPassword(email: String, password: String) async throws{
        do{
            try await authService.signUpWithEmail(email: email, password: password)
            isAuthenticated = true
        }catch{
            if let authError = error as? AuthError {
                SnackbarManager.shared.show(authError.localizedDescription)
            } else {
                SnackbarManager.shared.show(error.localizedDescription)
            }
        }
    }
    
    //MARK: - SignOut
    func signOut() {
        do {
            try authService.signOut()
            isAuthenticated = false
        } catch {
            if let authError = error as? AuthError {
                SnackbarManager.shared.show(authError.localizedDescription)
            } else {
                SnackbarManager.shared.show(error.localizedDescription)
            }
        }
    }
}
