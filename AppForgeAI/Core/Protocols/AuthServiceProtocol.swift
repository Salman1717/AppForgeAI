//
//  AuthServiceProtocol.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation

protocol AuthServiceProtocol{
    
    func signInWithGoogle() async throws
    
    func signInWithEmail(email: String, password: String) async throws
    
    func signUpWithEmail(email: String, password: String) async throws
    
    func signOut() throws
    
    var currentUserId: String? { get }
    
}
