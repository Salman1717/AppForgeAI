//
//  IdeaInputViewModel.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation
import Combine

@MainActor
final class IdeaInputViewModel:ObservableObject{
    
    @Published var ideaText = ""
    @Published var isLoading = false
    @Published var generatedBlueprint: Blueprint?
    
    private let aiService: AIServiceProtocol
    private let blueprintRepo: BlueprintRepositoryProtocol
    
    init(
        aiService: AIServiceProtocol,
        blueprintRepo: BlueprintRepositoryProtocol
    ){
        self.aiService = aiService
        self.blueprintRepo = blueprintRepo
    }
    
    func generateBlueprint() async{
        
        isLoading = true
        
        let maxRetries = 2
        var attempt = 0
        
        while attempt <= maxRetries{
            
            do{
                let json = try await aiService.generateBlueprint(from: ideaText)
                
                let blueprint = try BlueprintDecoder.decode(json: json, idea: ideaText)
                
                try await blueprintRepo.save(blueprint)

                self.generatedBlueprint = blueprint
                
                isLoading = false
                
                return
                
            }catch{
                
                attempt += 1
                isLoading = false
                
                SnackbarManager.shared.show(error.localizedDescription)
                
                if attempt > maxRetries{
                    SnackbarManager.shared.show(GeminiError.maxRetriesReached.localizedDescription)
                    isLoading = false
                    return
                }
                
                try? await Task.sleep(nanoseconds: 700_000_000)
            }
        }
        
    }
    
}
