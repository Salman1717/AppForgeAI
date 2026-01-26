//
//  AuthErrors.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 26/01/26.
//

import Foundation

enum AuthError : LocalizedError, Equatable{
    case invalidCredentials
    case emailAlreadyInUse
    case weakPassword
    case userCancelled
    case networkFailure
    case unknown
    
    var errorDescription: String? {
        
        
        switch self {
            
            
        case .invalidCredentials:
            return "Invalid email or password."
            
            
        case .emailAlreadyInUse:
            return "This email is already registered."
            
            
        case .weakPassword:
            return "Password must be at least 6 characters."
            
            
        case .userCancelled:
            return "Login was cancelled."
            
            
        case .networkFailure:
            return "Network error. Please try again."
            
            
        case .unknown:
            return "Something went wrong. Try again."
        }
    }
}
