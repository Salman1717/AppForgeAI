//
//  BlueButton.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 28/01/26.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .background{
                LinearGradient(
                    colors: [.electricBlue,.blue],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }
            .foregroundStyle(.offwhite)
            .clipShape(Capsule())
    }
}
