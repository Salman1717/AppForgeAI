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

            Text(blueprint.description)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(blueprint.createdAt, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}

//#Preview {
//    HistoryRow()
//}
