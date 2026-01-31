//
//  BlueprintGenLoader.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 29/01/26.
//

import SwiftUI

struct BlueprintGenLoader: View {
    var body: some View {
        ZStack{
            
            Color(.black).ignoresSafeArea()
            VStack{
                Spacer()
                ZStack{
                    
                    Circle()
                        .frame(width: 250, height: 250)
                        .blur(radius: 100, opaque: false)
                        .foregroundStyle(.electricBlue.opacity(0.8))
                    
                    RotatingRectanglesLoader()
                        .frame(width: 200, height: 200 )
                    
                    
                    Circle()
                        .frame(width: 54, height: 54)
                        .foregroundStyle(.electricBlue)
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.black)
                    
                    
                    Image(systemName: "compass.drawing")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color.electricBlue)
                }
                
                Text("Creating Blueprint...")
                    .font(.title2)
                    .italic()
                    .bold()
                    .foregroundStyle(.offwhite)
                    .padding()
                
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    BlueprintGenLoader()
}
