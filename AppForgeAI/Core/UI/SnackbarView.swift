//
//  SnackbarView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 06/02/26.
//

import SwiftUI

struct SnackbarView: View {
    
    @ObservedObject var manager: SnackbarManager
    
    var body: some View {
        
        if let message = manager.message,
           manager.isShowing {
            
            HStack(spacing: 10) {
                
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.electricBlue)
                
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding()
            .background{
                ZStack{
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundStyle(.offwhite.opacity(0.05))
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.offwhite.opacity(0.15), lineWidth: 1)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .transition(
                .move(edge: .bottom)
                .combined(with: .opacity)
            )
            .animation(.easeInOut, value: manager.isShowing)
        }
    }
}



