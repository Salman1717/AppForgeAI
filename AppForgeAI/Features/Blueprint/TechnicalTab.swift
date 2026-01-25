//
//  TechnicalTab.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct TechnicalTab: View {

    let technical: TechnicalSpec

    var body: some View {

        ScrollView {

            VStack(spacing: 16) {

                InfoCard(title: "Platform", text: technical.platform)

                InfoCard(title: "Framework", text: technical.uiFramework)

                ListCard(title: "Backend", items: technical.backend)

                ListCard(title: "Screens", items: technical.screens)

                InfoCard(
                    title: "Architecture",
                    text: technical.architectureNotes
                )
            }
            .padding(.vertical)
        }
    }
}
