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
    @Published var userEmail = ""
    
    private let authService: AuthServiceProtocol
    
    init(authService:AuthServiceProtocol){
        self.authService = authService
    }
}
