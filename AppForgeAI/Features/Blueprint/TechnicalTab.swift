//
//  TechnicalTab.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import SwiftUI

struct TechnicalTab: View {

    let technical: TechnicalSpec
    let viewModel: BlueprintViewModel

    var body: some View {
        ZStack{
            Color(.darkBlue).ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    InfoCard(title: "Platform", text: technical.platform, image: "ipad.and.iphone")
                    
                    InfoCard(title: "Framework", text: technical.uiFramework, image: "square.3.layers.3d.down.left")
                    
                    ListCard(title: "Backend", items: technical.backend, image: "server.rack")
                    
                    SchemaView(schema: technical.databaseSchema, onCopy: viewModel.copyDatabaseSchema)
                    
                    ListCard(title: "Screens", items: technical.screens, image: "rectangle.on.rectangle")
                    
                    InfoCard(
                        title: "Architecture",
                        text: technical.architectureNotes,
                        image: "building.columns"
                    )
                }
                .padding(.vertical)
            }
        }
    }
}
