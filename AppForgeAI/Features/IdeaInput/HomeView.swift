//
//  HomeView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: IdeaInputViewModel
    
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
                
                
                if let blueprint = viewModel.generatedBlueprint {
                    
                    
                    Text("✅ Generated:")
                        .font(.headline)
                    
                    
                    Text(blueprint.product.problemStatement)
                        .font(.subheadline)
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("AppForge AI")
        }
    }
}

#Preview {
    //    HomeView()
}
