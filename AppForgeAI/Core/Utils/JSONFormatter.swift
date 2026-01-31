//
//  JSONFormatter.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 31/01/26.
//

import Foundation

enum JSONFormatter {

    static func prettyPrint(_ dict: [String: [String: String]]) -> String {

        guard
            let data = try? JSONSerialization.data(
                withJSONObject: dict,
                options: [.prettyPrinted]
            ),
            let text = String(data: data, encoding: .utf8)
        else {
            return "{}"
        }

        return text
    }
}
