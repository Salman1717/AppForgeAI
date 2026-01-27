//
//  FirestoreErrors.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 28/01/26.
//

import Foundation

enum FirestoreError : LocalizedError, Equatable{
    case notAuthenticated
    case permissionDenied
    case networkFailure
    case encodingFailed
    case decodingFailed
    case documentNotFound
    case unknown
    
    var errorDescription: String? {
        switch self{
        case .notAuthenticated:
            return "Please Log In to continue."
        case .permissionDenied:
            return "You don't have permission to access this data."
        case .networkFailure:
            return "Network error. Check your connection."
        case .encodingFailed:
            return "Failed to save data."
        case .decodingFailed:
            return "Failed to load saved data."
        case .documentNotFound:
            return "Item not found."
        case .unknown:
            return "Something went wrong. Please try again."
        }
    }
    
}
