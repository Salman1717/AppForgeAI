//
//  GeminiError.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

enum GeminiError: LocalizedError{
    case invalidInput
    case emptyResponse
    case decodingFailed
    
    var errorDescription: String?{
        switch self{
        case .invalidInput:
            return "Idea cannot be Empty"
        case .emptyResponse:
            return "No Response from AI"
        case .decodingFailed:
            return "Invalid AI Response Format"
        }
    }
}
