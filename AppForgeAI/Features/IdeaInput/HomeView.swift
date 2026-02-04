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
            ZStack{
                
                Color(.darkBlue).ignoresSafeArea()
                
                
                VStack(alignment: .leading, spacing:20){
                    
                    header()
                    
                    Text("Let's turn your vision into Reality!")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                    
                    
                    textBox()
                    
                    
                    
                    NavigationLink(destination: HistoryView(repo: AppContainer().blueprintRepo) ) {
                        Text("Veiw Previous Blueprints")
                            .bold()
                            .font(.body)
                            .foregroundStyle(.electricBlue)
                            .underline()
                            .italic()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                         
                    }
                    
                    Spacer()
                    
                    
                    if let error = viewModel.error{
                        Text(error)
                            .foregroundStyle(.red)
                    }
                    
                    Button(action:{
                        Task{
                            await viewModel.generateBlueprint()
                        }
                    }, label:{
                        HStack(spacing: 30){
                            Image(systemName: "wand.and.stars.inverse")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Forge Blueprint")
                                .bold()
                        }
                    }
                    )
                    .buttonStyle(BlueButton())
                    
                    
                    
                }
                .scrollDismissesKeyboard(.interactively)
                .padding()
                .fullScreenCover(isPresented: $viewModel.isLoading){
                    BlueprintGenLoader()
                }
                .navigationDestination(
                    isPresented: Binding(
                        get: { viewModel.generatedBlueprint != nil },
                        set: { _ in }
                    )
                ){
                    if let blueprint = viewModel.generatedBlueprint{
                        BlueprintView(blueprint: blueprint)
                    }
                }
                
                
            }
        }
    }
    
    private func header() -> some View{
        HStack{
            
            VStack(alignment: .leading, spacing:4) {
                Text("Welcome back 👋")
                    .font(.headline)
                    .foregroundStyle(.offwhite)
                
                Text(authViewModel.userName)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            Image(systemName: "power")
                .resizable()
                .frame(width: 22, height: 22)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.red)
                .padding(12)
                .background(Circle().foregroundStyle(.offwhite.opacity(0.2)))
                .onTapGesture {
                    authViewModel.signOut()
                }
            
        }
    }
    
    private func textBox() -> some View {
        ZStack(alignment: .topLeading) {
            // Background and border
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.electricBlue.opacity(0.2), .electricBlue.opacity(0.1)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.offwhite.opacity(0.5), lineWidth: 0.5)
            
            // Placeholder text
            if viewModel.ideaText.isEmpty {
                Text("What are you trying to build Today? Describe your concept...")
                    .foregroundStyle(.offwhite.opacity(0.8))
                    .padding()
                    .font(.body)
                    .allowsHitTesting(false)
            }
            
            // TextEditor
            TextEditor(text: $viewModel.ideaText)
                .scrollContentBackground(.hidden)
                .frame(height: 150)
                .foregroundStyle(.offwhite)
                .font(.body)
                .padding()
                .background(Color.clear)
        }
        .frame(minHeight: 150, maxHeight: 180)
    }
}

#Preview {
    let Container = AppContainer()
    HomeView(
        viewModel: IdeaInputViewModel(
            aiService: Container.aiService,
            blueprintRepo: Container.blueprintRepo
        ),
        authViewModel: AuthViewModel(
            authService: FirebaseAuthService()
        )
    )
}


