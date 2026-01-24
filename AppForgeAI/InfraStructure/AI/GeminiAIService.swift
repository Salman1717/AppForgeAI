//
//  GeminiAIService.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation
import FirebaseAILogic

final class GeminiAIService: AIServiceProtocol{
    
    private let model: GenerativeModel
    
    init(modelName: String = "gemini-2.5-flash") {
        
        let ai = FirebaseAI.firebaseAI(backend: .googleAI())
        self.model = ai.generativeModel(modelName: modelName)
    }
    
    func generateBlueprint(from idea: String) async throws -> String {
        
        guard !idea.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            throw GeminiError.invalidInput
        }
        
        let prompt = GeminiPromptBuilder.build(for: idea)
        
        let response = try await model.generateContent(prompt)
        
        guard let text = response.text else{
            throw GeminiError.emptyResponse
        }
        
        return text
    }
}
