//
//  AuthServiceProtocol.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

protocol AuthServiceProtocol{
    var isAuthenticated:Bool { get }
    
    func signIn() async throws
    
    func signOut() throws
    
}
