//
//  BlueprintView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct BlueprintView: View {

    @StateObject private var viewModel: BlueprintViewModel
    @State private var selectedTab = 0

    init(blueprint: Blueprint) {
        _viewModel = StateObject(
            wrappedValue: BlueprintViewModel(blueprint: blueprint)
        )
    }

    var body: some View {

        VStack(spacing: 16) {

            // Header
            Text(viewModel.blueprint.title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            // Segmented Control
            Picker("Section", selection: $selectedTab) {
                Text("Product").tag(0)
                Text("Technical").tag(1)
                Text("Financial").tag(2)
            }
            .pickerStyle(.segmented)

            // Content
            TabView(selection: $selectedTab) {

                ProductTab(product: viewModel.blueprint.product)
                    .tag(0)

                TechnicalTab(technical: viewModel.blueprint.technical, viewModel: viewModel)
                    .tag(1)

                FinancialTab(financial: viewModel.blueprint.financial)
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            // Action Buttons
            HStack {

                Button("Copy Pitch") {
                    viewModel.copyProductSummary()
                }

                Spacer()

                Button("Copy Schema") {
                    viewModel.copyDatabaseSchema()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Blueprint")
    }
}

#Preview {
    BlueprintView(blueprint: Blueprint.mock)
}
