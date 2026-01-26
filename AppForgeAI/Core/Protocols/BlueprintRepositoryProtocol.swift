//
//  BlueprintRepositoryProtocol.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

protocol BlueprintRepositoryProtocol {
    
    func save(_ blueprint: Blueprint) async throws
    
    func fetchAll() async throws -> [Blueprint]
    
    func delete(id: String) async throws
    
}
