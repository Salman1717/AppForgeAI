//
//  CustomSegmentedPicker.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 01/02/26.
//

import SwiftUI

struct CustomSegmentedPicker: View {
    
    let items: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            ForEach(items.indices, id: \.self) { index in
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        selectedIndex = index
                    }
                } label: {
                    
                    Text(items[index])
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(
                            selectedIndex == index
                            ? .white
                            : .offwhite.opacity(0.8)
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            ZStack {
                                
                                if selectedIndex == index {
                                    Capsule()
                                        .fill(
                                            .electricBlue
                                        )
                                }
                            }
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(
            Capsule()
                .fill(.offwhite.opacity(0.09))
                .overlay(
                    Capsule()
                        .stroke(Color.offwhite.opacity(0.15),lineWidth: 1)
                )
        )
    }
}

#Preview {
    CustomSegmentedPicker(
        items: ["Product", "Technical", "Financial"],
        selectedIndex: .constant(0)
    )
    .padding()
    .background(Color.black)
}

