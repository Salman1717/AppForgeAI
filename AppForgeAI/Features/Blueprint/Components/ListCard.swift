//
//  ListCard.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct ListCard: View {
    let title: String
    let items: [String]
    
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 8) {
            
            
            Text(title)
                .font(.headline)
            
            
            ForEach(items, id: \.self) { item in
                
                
                HStack(alignment: .top) {
                    
                    
                    Text("•")
                    
                    
                    Text(item)
                        .font(.body)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .cornerRadius(14)
    }
}

