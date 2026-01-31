//
//  BlueprintMock.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 31/01/26.
//

import Foundation

extension Blueprint {

    static let mock = Blueprint(
        id: UUID().uuidString,
        ownerId: "preview_user",

        title: "WalkMate",
        description: "Simple walking and fitness tracking app",

        rawIdea: "An app to track daily walks and fitness stats",

        product: .mock,
        technical: .mock,
        financial: .mock,

        createdAt: Date()
    )
}

