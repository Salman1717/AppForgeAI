//
//  GeminiPromptBuilder.swift.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

enum GeminiPromptBuilder{
    
    static func build(for idea:String) -> String{
        """
        You are an expert product architect and iOS engineer.
        
        
        Convert the following app idea into a structured JSON blueprint.
        
        
        Return ONLY valid JSON.
        
        
        Follow this schema strictly:
        
        
        {
        "product": {
        "problemStatement": "",
        "targetAudience": "",
        "uniqueValueProposition": "",
        "mvpFeatures": [],
        "futureFeatures": []
        },
        "technical": {
        "platform": "iOS",
        "uiFramework": "SwiftUI",
        "backend": [],
        "screens": [],
        "databaseSchema": {},
        "architectureNotes": ""
        },
        "financial": {
        "estimatedHours": 0,
        "indieCostRange": "",
        "freelancerCostRange": "",
        "agencyCostRange": ""
        }
        }
        
        
        App Idea:
        \(idea)
        
        Important:
        - Do NOT wrap output in ```json
        - Do NOT add comments
        - Do NOT add extra text
        
        """
    }
}
