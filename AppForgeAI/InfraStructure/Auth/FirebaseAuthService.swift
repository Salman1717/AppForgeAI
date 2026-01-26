//
//  FirebaseAuthService.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

final class FirebaseAuthService: AuthServiceProtocol{
    
    var currentUserId: String?{
        Auth.auth().currentUser?.uid
    }
    
    //MARK: - Google Sign In
    func signInWithGoogle() async throws {
        guard let clientId = FirebaseApp.app()?.options.clientID,
              let rootVC =  UIApplication.shared.firstKeyWindow?.rootViewController
        else {
            throw URLError(.badServerResponse)
        }
        
        let config = GIDConfiguration(clientID: clientId)
        
        let result = try await GIDSignIn.sharedInstance.signIn(
            withPresenting: rootVC
        )
        
        guard let idToken = result.user.idToken?.tokenString else{
            throw URLError(.cannotParseResponse)
        }
        
        let accessToken = result.user.accessToken.tokenString
        
        let credentials = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: accessToken
        )
        
        try await Auth.auth().signIn(with: credentials)
    }
    
    //MARK: - Email
    
    func signInWithEmail(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signUpWithEmail(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    // MARK: -  Sign Out
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
