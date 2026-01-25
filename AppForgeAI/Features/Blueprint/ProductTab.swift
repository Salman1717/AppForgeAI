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

        ScrollView {

            VStack(spacing: 16) {

                InfoCard(title: "Problem", text: product.problemStatement)

                InfoCard(title: "Target Users", text: product.targetAudience)

                InfoCard(title: "Value Proposition", text: product.uniqueValueProposition)

                ListCard(title: "MVP Features", items: product.mvpFeatures)

                ListCard(title: "Future Features", items: product.futureFeatures)
            }
            .padding(.vertical)
        }
    }
}
