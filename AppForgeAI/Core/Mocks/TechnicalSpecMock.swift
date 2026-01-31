//
//  TechnicalSpecMock.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 31/01/26.
//

import Foundation

extension TechnicalSpec {

    static let mock = TechnicalSpec(
        platform: "iOS",
        uiFramework: "SwiftUI",
        backend: [
            "Firebase Auth",
            "Firestore",
            "Gemini API"
        ],
        screens: [
            "Login",
            "Home",
            "Blueprint",
            "History",
            "Profile"
        ],
        databaseSchema: [
            "WalkSession": [
                "id": "UUID",
                "startTime": "Date",
                "endTime": "Date",
                "distance": "Double",
                "steps": "Int",
                "route": "[LatLng]"
            ],
            "UserPreferences": [
                "id": "UUID",
                "units": "String",
                "displayName": "String"
            ]
        ],
        architectureNotes: "MVVM with protocol-oriented design and Firebase backend"
    )
}
