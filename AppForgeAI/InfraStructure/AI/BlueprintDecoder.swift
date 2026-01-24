//
//  BlueprintDecoder.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

enum BlueprintDecoder{
    
    static func decode(json: String, idea: String) throws -> Blueprint{
        
        let cleaned = json
        .replacingOccurrences(of: "```json", with: "")
        .replacingOccurrences(of: "```", with: "")
        .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let data = cleaned.data(using: .utf8) else{
            throw GeminiError.decodingFailed
        }
        
        
        
        struct rawBlueprint: Codable{
            let product: ProductSpec
            let technical: TechnicalSpec
            let financial: FinancialSpec
        }
        
        let raw = try JSONDecoder().decode(rawBlueprint.self, from: data)
        
        return Blueprint(
            id: UUID().uuidString,
            title: raw.product.uniqueValueProposition,
            rawIdea: idea,
            product: raw.product,
            technical: raw.technical,
            financial: raw.financial,
            createdAt: Date()
        )
    }
    
}
