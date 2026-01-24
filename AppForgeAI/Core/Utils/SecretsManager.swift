//
//  SecretsManager.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import Foundation

enum SecretsManager{
    static func geminiAPIKey() -> String{
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let key = dict["GEMINI_API_KEY"] as? String,
              !key.isEmpty
        else{
            fatalError("API key not Found")
        }
        return key
    }
}
