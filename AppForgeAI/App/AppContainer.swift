//
//  AppContainer.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

final class AppContainer{
    
    
    let aiService: AIServiceProtocol
    let blueprintRepo: BlueprintRepositoryProtocol
    
    init(
        aiService: AIServiceProtocol = GeminiAIService(),
        blueprintRepo: BlueprintRepositoryProtocol = FirestoreBlueprintRepository()
    ){
        self.aiService = aiService
        self.blueprintRepo = blueprintRepo
    }
}
