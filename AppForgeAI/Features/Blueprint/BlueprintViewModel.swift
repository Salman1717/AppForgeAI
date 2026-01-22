//
//  BlueprintViewModel.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 23/01/26.
//

import Foundation
import Combine

@MainActor
final class BlueprintViewModel: ObservableObject{
    
    private let blueprintService: BlueprintRepositoryProtocol
    
    init(blueprintService: BlueprintRepositoryProtocol) {
        self.blueprintService = blueprintService
    }
}
