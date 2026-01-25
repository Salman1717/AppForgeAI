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
        
        VStack(spacing: 16) {
            
            InfoCard(
                title: "Estimated Hours",
                text: "\(financial.estimatedHours) hrs"
            )
            
            InfoCard(
                title: "Indie Cost",
                text: financial.indieCostRange
            )
            
            InfoCard(
                title: "Freelancer Cost",
                text: financial.freelancerCostRange
            )
            
            InfoCard(
                title: "Agency Cost",
                text: financial.agencyCostRange
            )
            
            Spacer()
        }
        .padding(.vertical)
    }
}

