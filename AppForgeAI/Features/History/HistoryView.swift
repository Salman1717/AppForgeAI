//
//  HistoryView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 28/01/26.
//

import SwiftUI

struct HistoryView: View {

    @StateObject private var viewModel: HistoryViewModel

    init(repo: BlueprintRepositoryProtocol) {
        _viewModel = StateObject(
            wrappedValue: HistoryViewModel(repo: repo)
        )
    }

    var body: some View {

        NavigationStack {

            Group {

                if viewModel.isLoading {
                    ProgressView("Loading...")
                }

                else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }

                else if viewModel.blueprints.isEmpty {
                    Text("No blueprints yet.")
                        .foregroundColor(.secondary)
                }

                else {

                    List {

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
                }
            }
            .navigationTitle("History")
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {

                    Button {
                        Task { await viewModel.load() }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .task {
                await viewModel.load()
            }
        }
    }
}

//#Preview {
//    HistoryView()
//}
