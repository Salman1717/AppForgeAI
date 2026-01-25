//
//  InfoCard.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct InfoCard: View {
    let title: String
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            
            Text(title)
                .font(.headline)
            
            
            Text(text)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .cornerRadius(14)
    }
}


#Preview {
    let title = "Dummy"
    let text = "Dummy"
    InfoCard(title: title, text: text)
}
