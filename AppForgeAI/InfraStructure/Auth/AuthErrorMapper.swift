//
//  AuthErrorMapper.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 26/01/26.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

enum AuthErrorMapper {
    
    static func map(_ error: Error) -> AuthError {
        
        // Google Cancel
        if let gidError = error as? GIDSignInError,
           gidError.code == .canceled {
            return .userCancelled
        }
        
        let nsError = error as NSError
        
        // Firebase Auth Errors
        if nsError.domain == AuthErrorDomain {
            
            switch nsError.code {
                
            case AuthErrorCode.wrongPassword.rawValue,
                AuthErrorCode.userNotFound.rawValue:
                return .invalidCredentials
                
            case AuthErrorCode.emailAlreadyInUse.rawValue:
                return .emailAlreadyInUse
                
            case AuthErrorCode.weakPassword.rawValue:
                return .weakPassword
                
            case AuthErrorCode.networkError.rawValue:
                return .networkFailure
                
            default:
                return .unknown
            }
        }
        
        return .unknown
    }
}
