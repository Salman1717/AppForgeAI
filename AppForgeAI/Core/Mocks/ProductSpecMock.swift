//
//  ProductSpecMock.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 31/01/26.
//

import Foundation

extension ProductSpec {

    static let mock = ProductSpec(
        problemStatement: "People want to track their daily walks but existing apps are complex.",
        targetAudience: "Casual walkers, hikers, and fitness beginners",
        uniqueValueProposition: "A clean and simple walking tracker with no distractions",
        mvpFeatures: [
            "Start and stop walk tracking",
            "Live distance and pace",
            "Route mapping",
            "Session summary",
            "History view"
        ],
        futureFeatures: [
            "Apple Watch app",
            "HealthKit sync",
            "Social sharing",
            "Challenges",
            "Cloud backup"
        ]
    )
}
