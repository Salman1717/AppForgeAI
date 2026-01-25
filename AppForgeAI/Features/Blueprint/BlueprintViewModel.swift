//
//  BlueprintViewModel.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation
import Combine

@MainActor
final class BlueprintViewModel: ObservableObject{
    
     let blueprint: Blueprint
    
    init(blueprint: Blueprint) {
        self.blueprint = blueprint
    }
    
    func copyProductSummary(){
        let text = """
            
            \(blueprint.product.uniqueValueProposition)
            
            Problem:
            \(blueprint.product.problemStatement)
            
            MVP:
            \(blueprint.product.mvpFeatures.joined(separator: ","))
            
            """
        
        ClipboardManager.copy(text)
    }
    
    func copyDatabaseSchema(){
        guard
            let data = try?JSONEncoder().encode(blueprint.technical.databaseSchema),
            let text = String(data:data, encoding: .utf8)
        else{
            return
        }
        
        ClipboardManager.copy(text)
    }
}
