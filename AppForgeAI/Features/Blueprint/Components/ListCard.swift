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
    var image: String?
    
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 8) {
            
            
            HStack{
                
                Image(systemName: image ?? "append.page.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.electricBlue)
                
                
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
            }
            
            VStack(alignment: .leading, spacing:8){
                ForEach(items, id: \.self) { item in
                    
                    
                    HStack(alignment: .top, spacing: 8) {
                        
                        
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.electricBlue)
                        
                        
                        Text(item)
                            .font(.body)
                            .foregroundStyle(.offwhite)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background{
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.offwhite.opacity(0.05))
                    
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.offwhite.opacity(0.15))
                }
            }
        }
        .padding()
    }
}

