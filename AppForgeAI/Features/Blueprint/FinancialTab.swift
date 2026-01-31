//
//  FinancialTab.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct FinancialTab: View {
    
    let financial: FinancialSpec
    
    var body: some View {
        ZStack{
            
            Color(.darkBlue).ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                InfoCard(
                    title: "Estimated Hours",
                    text: "\(financial.estimatedHours) hrs",
                    image: "hourglass.end"
                )
                
                InfoCard(
                    title: "Indie Cost",
                    text: financial.indieCostRange,
                    image: "person.fill"
                )
                
                InfoCard(
                    title: "Freelancer Cost",
                    text: financial.freelancerCostRange,
                    image: "person.circle.fill"
                )
                
                InfoCard(
                    title: "Agency Cost",
                    text: financial.agencyCostRange,
                    image: "person.3.fill"
                )
                
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

#Preview{
    FinancialTab(financial: FinancialSpec.mock)
}
