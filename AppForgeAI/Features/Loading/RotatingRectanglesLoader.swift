//
//  RotatingRectanglesLoader.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 29/01/26.
//

import SwiftUI

struct RotatingRectanglesLoader: View {
    
    @State private var animate = false
    
    let count = 3
    
    var body: some View {
        ZStack {
            
            ForEach(0..<count, id: \.self) { index in
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.electricBlue.opacity(0.8), lineWidth: 2)
                    // SCALE
                    .scaleEffect(animate ? 0.3 : 1)
                    
                    // ROTATION (alternate direction)
                    .rotationEffect(
                        .degrees(
                            animate
                            ? 360
                            : 0
                        )
                    )
                    
                    // DEPTH / BACKWARD MOVE
                    .offset(
                        y: animate ? CGFloat(index * 5) : 0
                    )
                    
                    // FADE
                    .opacity(animate ? 0 : 1)
                    
                    // DELAYED ANIMATION
                    .animation(
                        .easeInOut(duration: 2.5)
                        .repeatForever(autoreverses: false)
                        .delay(Double(index) * 0.2),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    RotatingRectanglesLoader()
        .frame(width: 200, height: 200)
}
