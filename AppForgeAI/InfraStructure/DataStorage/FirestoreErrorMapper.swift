//
//  FirestoreErrorMapper.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 28/01/26.
//

import Foundation
import FirebaseFirestore

enum FirestoreErrorMapper{
    
    static func map(_ error: Error) -> FirestoreError{
        
        let nsError = error as NSError
        
        if nsError.domain == FirestoreErrorDomain{
            
            switch nsError.code{
                
            case FirestoreErrorCode.permissionDenied.rawValue:
                return .permissionDenied
                
            case FirestoreErrorCode.unknown.rawValue:
                return .networkFailure
                
            case FirestoreErrorCode.notFound.rawValue:
                return .documentNotFound
                
            default:
                return .unknown
                
            }
        }
        return .unknown
    }
}
