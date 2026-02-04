//
//  HistoryRow.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 28/01/26.
//

import SwiftUI

import SwiftUI

struct HistoryRow: View {

    let blueprint: Blueprint

    var body: some View {

        VStack(alignment: .leading, spacing: 4) {

            Text(blueprint.title)
                .font(.headline)
                .foregroundStyle(.electricBlue)

            Text(blueprint.description)
                .font(.subheadline)
                .foregroundColor(.offwhite)
                .multilineTextAlignment(.leading)

            Text(blueprint.createdAt, style: .date)
                .font(.caption)
                .foregroundColor(.orange)
                .frame(maxWidth: .infinity, alignment: .trailing)
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
        .padding(4)
    }
}

#Preview {
    HistoryRow(blueprint: Blueprint.mock)
        .background(.darkBlue)
}
