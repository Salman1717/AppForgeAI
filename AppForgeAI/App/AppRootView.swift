//
//  AppRootView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import SwiftUI

struct AppRootView: View{
    
    private let container = AppContainer()
    
    var body: some View{
        HomeView(viewModel: IdeaInputViewModel(aiService: container.aiService))
    }
}
