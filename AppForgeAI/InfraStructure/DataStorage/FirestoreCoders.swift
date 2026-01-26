//
//  FirestoreCoders.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 26/01/26.
//

import Foundation

enum FirestoreEncoder{
    
    static func encode<T: Codable>(_ value :  T) throws -> [String: Any] {
        let data = try JSONEncoder().encode(value)
        
        let json = try JSONSerialization.jsonObject(with: data)
        
        guard let dict = json as? [String: Any] else {
            throw NSError(domain: "encoding", code: -1)
        }
        
        return dict
    }
}

enum FirestoreDecoder{
    static func decode<T: Codable>(_ type: T.Type, from dict: [String:Any]) throws -> T{
        let data = try JSONSerialization.data(withJSONObject: dict)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
