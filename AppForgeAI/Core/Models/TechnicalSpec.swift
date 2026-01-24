//
//  TechnicalSpec.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

struct TechnicalSpec: Codable{
    let platform: String
    let uiFramework: String
    let backend: [String]
    let screens: [String]
    let databaseSchema: [String: [String: String]]
    let architectureNotes: String
}
