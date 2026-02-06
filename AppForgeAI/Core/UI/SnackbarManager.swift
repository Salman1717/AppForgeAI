//
//  SnackbarManager.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 06/02/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class SnackbarManager: ObservableObject {

    @Published var message: String?
    @Published var isShowing = false

    static let shared = SnackbarManager()

    private init() {}

    func show(_ text: String, duration: Double = 3.5) {

        message = text
        isShowing = true

        Task {

            try? await Task.sleep(
                nanoseconds: UInt64(duration * 1_000_000_000)
            )

            withAnimation {
                self.isShowing = false
            }

            try? await Task.sleep(nanoseconds: 300_000_000)

            self.message = nil
        }
    }
}

