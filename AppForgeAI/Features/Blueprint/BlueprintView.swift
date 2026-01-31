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
    @Environment(\.dismiss) var dismiss
    
    init(blueprint: Blueprint) {
        _viewModel = StateObject(
            wrappedValue: BlueprintViewModel(blueprint: blueprint)
        )
    }
    
    var body: some View {
        ZStack{
            
            Color(.darkBlue).ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                HStack{
                    Image(systemName: "arrowshape.left.circle.fill")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundStyle(.electricBlue)
                        .onTapGesture{
                            dismiss()
                        }
                    
                    Spacer()
                    
                    Text(viewModel.blueprint.title)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: "document.on.document")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.electricBlue)
                        .onTapGesture {
                            viewModel.copyProductSummary()
                        }
                    
                }
                
                CustomSegmentedPicker(
                    items: ["Product", "Technical", "Financial"],
                    selectedIndex: $selectedTab
                )
                .padding(.horizontal)
                
                
                TabView(selection: $selectedTab) {
                    
                    ProductTab(product: viewModel.blueprint.product)
                        .tag(0)
                    
                    TechnicalTab(
                        technical: viewModel.blueprint.technical,
                        viewModel: viewModel
                    )
                    .tag(1)
                    
                    FinancialTab(financial: viewModel.blueprint.financial)
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: selectedTab)
            }
            .padding()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    BlueprintView(blueprint: Blueprint.mock)
}
