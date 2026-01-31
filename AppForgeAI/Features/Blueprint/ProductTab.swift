//
//  ProductTab.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct ProductTab: View {
    
    let product: ProductSpec
    
    var body: some View {
        ZStack{
            Color(.darkBlue)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    InfoCard(
                        title: "Problem",
                        text: product.problemStatement,
                        image:"questionmark.diamond.fill"
                    )
                    
                    InfoCard(
                        title: "Target Users",
                        text: product.targetAudience,
                        image: "person.crop.circle.badge.checkmark"
                    )
                    
                    InfoCard(
                        title: "Value Proposition",
                        text: product.uniqueValueProposition,
                        image:"chart.line.uptrend.xyaxis"
                    )
                    
                    ListCard(
                        title: "MVP Features",
                        items: product.mvpFeatures,
                        image:"key.fill"
                    )
                    
                    ListCard(
                        title: "Future Features",
                        items: product.futureFeatures,
                        image:"sparkles.rectangle.stack"
                    )
                }
                .padding(.vertical)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ProductTab(product: ProductSpec.mock)
}
