//
//  LoginView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 26/01/26.
//


import SwiftUI

struct LoginView: View {

    @StateObject var viewModel: AuthViewModel

    @State private var email = ""
    @State private var password = ""

    var body: some View {

        VStack(spacing: 20) {

            Text("AppForge AI")
                .font(.largeTitle.bold())

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Sign In") {
                Task {
                    try await viewModel.signInWithEmailPassword(
                        email: email,
                        password: password
                    )
                }
            }

            Button("Sign Up") {
                Task {
                    try await viewModel.signUpWithEmailPassword(
                        email: email,
                        password: password
                    )
                }
            }

            Divider()

            Button("Continue with Google") {
                Task {
                    try await viewModel.signInWithGoogle()
                }
            }
            .buttonStyle(.borderedProminent)

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }
        .padding()
    }
}
