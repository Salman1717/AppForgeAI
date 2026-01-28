//
//  HistoryViewModel.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation
import Combine

@MainActor
final class HistoryViewModel: ObservableObject{
    
    @Published private(set) var blueprints: [Blueprint] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let repo : BlueprintRepositoryProtocol
    
    init(repo:BlueprintRepositoryProtocol){
        self.repo = repo
    }
    
    func load() async{
        isLoading = true
        errorMessage = nil
        
        do {
            blueprints = try await repo.fetchAll()
        } catch let err as FirestoreError {
            errorMessage = err.localizedDescription
        } catch {
            errorMessage = FirestoreError.unknown.localizedDescription
        }
        
        isLoading = false
    }
    
    func delete(at offsets: IndexSet) async{
        for index in offsets{
            let item = blueprints[index]
            
            do{
                try await repo.delete(id: item.id)
                blueprints.remove(at: index)
            }catch let err as FirestoreError {
                errorMessage = err.localizedDescription
            } catch {
                errorMessage = FirestoreError.unknown.localizedDescription
            }
            
        }
    }
    
}
