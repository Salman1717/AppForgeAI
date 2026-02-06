//
//  AppRootView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import SwiftUI

struct AppRootView: View {
    
    private let container = AppContainer()
    
    @StateObject private var authVM: AuthViewModel
    
    init() {
        let authService = FirebaseAuthService()
        _authVM = StateObject(
            wrappedValue: AuthViewModel(
                authService: authService
            )
        )
    }
    
    var body: some View {
        
        Group {
            
            if authVM.isAuthenticated {
                
                HomeView(
                    viewModel: IdeaInputViewModel(
                        aiService: container.aiService, blueprintRepo: container.blueprintRepo,
                    ), authViewModel: authVM
                )
                
            } else {
                
                LoginView(viewModel: authVM)
            }
        }
        .overlay(alignment: .center){
            SnackbarView(manager: .shared)
        }
    }
}

#Preview {
    AppRootView()
}
