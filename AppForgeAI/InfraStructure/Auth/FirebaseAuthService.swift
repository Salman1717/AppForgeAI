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
        
        _ = GIDConfiguration(clientID: clientId)
        
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
        
        do {
            try await Auth.auth().signIn(with: credentials)
        } catch {
            throw AuthErrorMapper.map(error)
        }
    }
    
    //MARK: - Email
    
    func signInWithEmail(email: String, password: String) async throws {
        do{
            try await Auth.auth().signIn(withEmail: email, password: password)
        }catch{
            throw AuthErrorMapper.map(error)
        }
    }
    
    func signUpWithEmail(email: String, password: String) async throws {
        do{
            try await Auth.auth().createUser(withEmail: email, password: password)
        }catch{
            throw AuthErrorMapper.map(error)
        }
    }
    
    // MARK: -  Sign Out
    
    func signOut() throws {
        do{
            try Auth.auth().signOut()
        }catch{
            throw AuthErrorMapper.map(error)
        }
    }
}
