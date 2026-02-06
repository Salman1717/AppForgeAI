//
//  LoginView.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 26/01/26.
//


import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
    
    @StateObject var viewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var isAnimate = false
    
    var body: some View {
        ZStack{
            
            Color.darkBlue.ignoresSafeArea()
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.electricBlue)
                .opacity(0.8)
                .blur(radius: 90)
                .offset(x: isAnimate ? -300 : 100, y: isAnimate ? -300 : 300)
                

            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.electricBlue)
                .opacity(0.8)
                .blur(radius: 90)
                .offset(x: isAnimate ? 300 : -100, y: isAnimate ? 300 : -300)
            
            VStack(spacing: 20) {
                
                Spacer()
                
                header()
                
                
                textfields()
                
                
                Spacer()
                
                actionButtons()
                    .padding()
                    .background{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundStyle(.offwhite.opacity(0.05))
                            
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color.offwhite.opacity(0.15), lineWidth: 1)
                        }
                    }
                
            }
            .padding()
            .onAppear{
                withAnimation(.easeInOut(duration: 3.5).repeatForever()){
                    isAnimate = true
                }
            }
        }
    }
    
    private func header() -> some View{
        VStack(spacing: 10){
            
            Image("AppForgeIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text("AppForge")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
        }
    }
    
    private func textfields() -> some View{
        VStack(spacing: 10){
            TextField("Email", text: $email)
                .textFieldStyle(CustomizedTextField())
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(CustomizedTextField())
        }
    }
    
    private func actionButtons() -> some View{
        VStack(spacing: 16){
            Button("Sign In") {
                Task {
                    try await viewModel.signInWithEmailPassword(
                        email: email,
                        password: password
                    )
                }
            }
            .buttonStyle(BlueButton())
            
            Button("Sign Up") {
                Task {
                    try await viewModel.signUpWithEmailPassword(
                        email: email,
                        password: password
                    )
                }
            }
            .buttonStyle(BlueButton())
            
            Divider()
            
            GoogleSignInButton(scheme: .light, style: .icon){
                Task {
                    try await viewModel.signInWithGoogle()
                }
            }
        }
    }
}

#Preview{
    LoginView(viewModel: AuthViewModel(authService: FirebaseAuthService()))
}


