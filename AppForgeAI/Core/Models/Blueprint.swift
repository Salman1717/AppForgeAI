//
//  Blueprint.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

struct Blueprint : Identifiable, Codable {
    
    let id: String
    let ownerId: String
    
    let title: String
    let description: String
    
    let rawIdea: String
    
    let product: ProductSpec
    let technical: TechnicalSpec
    let financial: FinancialSpec
    
    let createdAt: Date
}
