//
//  FinancialSpec.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

struct FinancialSpec: Codable{
    let estimatedHours: Int
    
    let indieCostRange: String
    let freelancerCostRange: String
    let agencyCostRange: String
}
