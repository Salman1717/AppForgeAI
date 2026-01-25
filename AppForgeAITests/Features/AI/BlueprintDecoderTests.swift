//
//  BlueprintDecoderTests.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 24/01/26.
//

import XCTest
@testable import AppForgeAI

final class BlueprintDecoderTests: XCTestCase{
    
    private let validJSON = """
    {
    "product": {
    "problemStatement": "Test problem",
    "targetAudience": "Test users",
    "uniqueValueProposition": "Test value",
    "mvpFeatures": ["A", "B"],
    "futureFeatures": ["C"]
    },
    "technical": {
    "platform": "iOS",
    "uiFramework": "SwiftUI",
    "backend": ["Firebase"],
    "screens": ["Home"],
    "databaseSchema": {
    "Test": {
    "id": "UUID"
    }
    },
    "architectureNotes": "Test notes"
    },
    "financial": {
    "estimatedHours": 10,
    "indieCostRange": "$100",
    "freelancerCostRange": "$200",
    "agencyCostRange": "$300"
    }
    }
    """
    
    func testDecodeValidJSON()  throws{
        let blueprint =  try BlueprintDecoder.decode(json: validJSON, idea: "Test Idea")
        
        XCTAssertEqual(blueprint.product.targetAudience, "Test users")
        XCTAssertEqual(blueprint.technical.platform, "iOS")
        XCTAssertEqual(blueprint.financial.estimatedHours, 10)
    }
    
    func testDecodeWithBlockWrapping() throws{
        let wrapped = """
        ``` json
        \(validJSON)
        ```
        """
        let blueprint =  try BlueprintDecoder.decode(json: wrapped, idea: "Test Idea")
        
        XCTAssertEqual(blueprint.product.mvpFeatures.count, 2)
    }
    
    func testEmptyJSONThrows() throws{
        XCTAssertThrowsError(
            try BlueprintDecoder.decode(json: " ", idea: "Empty")
        )
    }
    
    func testDecodeInvalidJSON() throws{
        let badJSON = " { invalid"
        
        XCTAssertThrowsError(
            try BlueprintDecoder.decode(json: badJSON, idea: "Broken")
        )
    }
    
    
}
