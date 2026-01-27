//
//  FirestoreBlueprintRepository.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 26/01/26.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class FirestoreBlueprintRepository: BlueprintRepositoryProtocol{
    
    private let db = Firestore.firestore()
    
    private func collection() throws -> CollectionReference{
        
        guard let uid = Auth.auth().currentUser?.uid else{
            throw FirestoreError.notAuthenticated
        }
        
        return db
            .collection("users")
            .document(uid)
            .collection("blueprints")
    }
    
    //MARK: - Save
    func save(_ blueprint:Blueprint) async throws{
        do{
            let data = try FirestoreEncoder.encode(blueprint)
            
            let col = try collection()
            
            try await col
                .document(blueprint.id)
                .setData(data)
        }catch let error as FirestoreError{
            throw error
        }catch{
            throw FirestoreErrorMapper.map(error)
        }
    }
    
    //MARK: - Fetch
    func fetchAll() async throws -> [Blueprint] {
        do{
            let col = try collection()
            
            let snapshot = try await col
                .order(by: "createdAt",descending: true)
                .getDocuments()
            
            return try snapshot.documents.map{
                try FirestoreDecoder.decode(Blueprint.self, from: $0.data())
            }
        }catch let error as FirestoreError{
            throw error
        }catch{
            throw FirestoreErrorMapper.map(error)
        }
    }
    
    //MARK: - Delete
    func delete(id: String) async throws {
        do{
            let col = try collection()
            try await col.document(id).delete()
        }catch let error as FirestoreError{
            throw error
        }catch{
            throw FirestoreErrorMapper.map(error)
        }
    }
}
