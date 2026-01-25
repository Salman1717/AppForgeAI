//
//  BlueprintDecoder.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

enum BlueprintDecoder{
    
    static func decode(json: String, idea: String) throws -> Blueprint{
        
        let cleaned =  clean(json)
        
        guard JSONValidator.isValidJSON(cleaned) else {
            throw GeminiError.decodingFailed
        }
        
        guard let data = cleaned.data(using: .utf8) else {
            throw GeminiError.decodingFailed
        }
        
        
        struct rawBlueprint: Codable{
            let meta: Meta
            let product: ProductSpec
            let technical: TechnicalSpec
            let financial: FinancialSpec
        }
        
        let raw = try JSONDecoder().decode(rawBlueprint.self, from: data)
        
        return Blueprint(
        id: UUID().uuidString,


        title: raw.meta.productName,
        description: raw.meta.tagline,


        rawIdea: idea,


        product: raw.product,
        technical: raw.technical,
        financial: raw.financial,
        createdAt: Date()
        )
    }
    
    private static func clean(_ text: String) -> String{
        var cleaned = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        cleaned = cleaned
            .replacingOccurrences(of: "```json", with: "")
            .replacingOccurrences(of: "``` json", with: "")
            .replacingOccurrences(of: "```", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        return cleaned
    }
}
