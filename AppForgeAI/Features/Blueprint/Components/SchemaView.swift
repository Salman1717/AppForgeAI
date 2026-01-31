//
//  SchemaView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 31/01/26.
//

import SwiftUI

struct SchemaView: View {

    let schema: [String: [String: String]]
    let onCopy: () -> Void

    private var formattedSchema: String {
        JSONFormatter.prettyPrint(schema)
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            // Header
            HStack {

                Text("Database Schema")
                    .font(.headline)
                    .foregroundStyle(.white)

                Spacer()

                Button {
                    onCopy()
                } label: {
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.offwhite)
                }
            }

            // Code Block
            ScrollView(.horizontal) {

                Text(formattedSchema)
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundColor(.orange)
                    .padding(12)
            }
            .scrollContentBackground(.hidden)
            .background{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.deepIndigo)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.offwhite.opacity(0.25))
                }
            }
            
        }
        .padding()
        .background{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.offwhite.opacity(0.05))
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.offwhite.opacity(0.15))
            }
        }
    }
}


// Preview
#Preview {
    SchemaView(schema: [
        "users": [
            "id": "String",
            "email": "String",
            "displayName": "String",
            "createdAt": "Timestamp"
        ],
        "posts": [
            "id": "String",
            "userId": "String",
            "title": "String",
            "content": "String",
            "createdAt": "Timestamp",
            "likes": "Int"
        ],
        "comments": [
            "id": "String",
            "postId": "String",
            "userId": "String",
            "text": "String",
            "createdAt": "Timestamp"
        ]
    ], onCopy: {})
    .padding()
    .background(Color.darkBlue)
}

