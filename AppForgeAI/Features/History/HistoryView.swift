//
//  HistoryView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 28/01/26.
//

import SwiftUI

struct HistoryView: View {

    @StateObject private var viewModel: HistoryViewModel
    @Environment(\.dismiss) var dismiss

    init(repo: BlueprintRepositoryProtocol) {
        _viewModel = StateObject(
            wrappedValue: HistoryViewModel(repo: repo)
        )
    }

    var body: some View {

        NavigationStack {
            ZStack{
                
                Color(.darkBlue).ignoresSafeArea()
                VStack{
                    
                    HStack(spacing: 14){
                        Image(systemName: "arrowshape.left.circle.fill")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundStyle(.electricBlue)
                            .onTapGesture{
                                dismiss()
                            }
                        
                        Text("History")
                            .font(.title2.bold())
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    
                    Group {
                        
                        if viewModel.isLoading {
                            RotatingRectanglesLoader()
                                .frame(width: 150, height: 150)
                        }
                        
                        
                        
                        else if viewModel.blueprints.isEmpty {
                            Text("No blueprints yet.")
                                .foregroundColor(.secondary)
                        }
                        
                        else {
                            
                            VStack {
                                ScrollView{
                                    ForEach(viewModel.blueprints) { blueprint in
                                        
                                        NavigationLink {
                                            
                                            BlueprintView(
                                                blueprint: blueprint,
                                            )
                                            
                                        } label: {
                                            
                                            HistoryRow(blueprint: blueprint)
                                        }
                                    }
                                    .onDelete { indexSet in
                                        Task {
                                            await viewModel.delete(at: indexSet)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .scrollContentBackground(.hidden)
                            }
                            
                        }
                    }
                    Spacer()
                }
                .task {
                    await viewModel.load()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HistoryView(repo: FirestoreBlueprintRepository())
}


