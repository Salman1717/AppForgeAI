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
    @Published var error:String?
    @Published var generatedBlueprint: Blueprint?
    
    private let aiService: AIServiceProtocol
    
    init(aiService: AIServiceProtocol){
        self.aiService = aiService
    }
    
    func generateBlueprint() async{
        
        isLoading = true
        error = nil
        
        let maxRetries = 2
        var attempt = 0
        
        while attempt <= maxRetries{
            
            do{
                let json = try await aiService.generateBlueprint(from: ideaText)
                
                let blueprint = try BlueprintDecoder.decode(json: json, idea: ideaText)
                
                self.generatedBlueprint = blueprint
                
                isLoading = false
                
                return
                
            }catch{
                
                attempt += 1
                isLoading = false
                
                self.error = error.localizedDescription
                
                if attempt > maxRetries{
                    self.error = GeminiError.maxRetriesReached.localizedDescription
                    isLoading = false
                    return
                }
                
                try? await Task.sleep(nanoseconds: 700_000_000)
            }
        }
        
    }
    
}
