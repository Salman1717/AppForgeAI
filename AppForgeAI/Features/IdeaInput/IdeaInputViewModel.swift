//
//  IdeaInputViewModel.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation
import Combine

@MainActor
final class IdeaInputViewModel:ObservableObject{
    
    @Published var ideaText = ""
    @Published var isLoading = false
    @Published var error:String?
    
    private let aiService: AIServiceProtocol
    
    init(aiService: AIServiceProtocol){
        self.aiService = aiService
    }

}
