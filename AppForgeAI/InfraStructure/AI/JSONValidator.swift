//
//  JSONValidator.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import Foundation

enum JSONValidator{
    static func isValidJSON(_ text: String) -> Bool{
        
        guard let data = text.data(using: .utf8) else{
            return false
        }
        
        do{
            _ = try JSONSerialization.jsonObject(with: data)
            return true
        }catch{
            return false
        }
    }
}
