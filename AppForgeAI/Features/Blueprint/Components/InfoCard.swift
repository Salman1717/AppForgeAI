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
            
            
            Text(text)
                .font(.body)
                .foregroundColor(.offwhite)
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


#Preview {
    let title = "Dummy"
    let text = "Dummy"
    
    InfoCard(title: title, text: text)
        .background(.darkBlue)
}
