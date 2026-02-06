//
//  CustomizedTextField.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 06/02/26.
//

import SwiftUI

struct CustomizedTextField: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .allowsHitTesting(true)
            .padding()
            .font(.body)
            .foregroundStyle(.white)
            .background{
                ZStack{
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundStyle(.offwhite.opacity(0.05))
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.offwhite.opacity(0.15), lineWidth: 1)
                }
            }
    }
}
