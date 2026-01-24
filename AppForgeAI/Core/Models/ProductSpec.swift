//
//  ProductSpec.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

struct ProductSpec: Codable{
    let problemStatement: String
    let targetAudience: String
    let uniqueValueProposition: String
    
    let mvpFeatures: [String]
    let futureFeatures: [String]
}
