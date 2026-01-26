//
//  HomeView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: IdeaInputViewModel
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack(spacing:20){
                
                TextEditor(text: $viewModel.ideaText)
                    .frame(height: 150)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke())
                
                if viewModel.isLoading{
                    ProgressView("Forging")
                }
                
                if let error = viewModel.error{
                    Text(error)
                        .foregroundStyle(.red)
                }
                
                Button("Forge Blueprint"){
                    Task{
                        await viewModel.generateBlueprint()
                    }
                }
                
                
                
                .buttonStyle(.borderedProminent)
                
                
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("AppForge AI")
            .navigationDestination(isPresented: .constant(viewModel.generatedBlueprint != nil)){
                if let blueprint = viewModel.generatedBlueprint{
                    BlueprintView(blueprint: blueprint)
                }
            }
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {

                    Button("Logout") {
                        authViewModel.signOut()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    //    HomeView()
}
