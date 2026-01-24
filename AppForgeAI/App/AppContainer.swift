//
//  AppContainer.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

final class AppContainer{
    
    
    let aiService: AIServiceProtocol
    
    
    init(
        aiService: AIServiceProtocol = GeminiAIService()
    ){
        self.aiService = aiService  
    }
}
