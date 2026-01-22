//
//  AppContainer.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

final class AppContainer{
    
    let authService: AuthServiceProtocol
    let aiService: AIServiceProtocol
    let blueprintRepository: BlueprintRepositoryProtocol
    
    init(
        authService: AuthServiceProtocol,
        aiService: AIServiceProtocol,
        blueprintRepository: BlueprintRepositoryProtocol
    ){
        self.authService = authService
        self.aiService = aiService
        self.blueprintRepository = blueprintRepository
    }
}
