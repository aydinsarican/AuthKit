//
//  LoginView.swift
//  AuthKit
//
//  Created by Aydın Sarıcan on 8.03.2025.
//

import SwiftUI
import AuthenticationServices // Apple Sign-In için

public struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    public var onLogin: ((String, String) -> Void)?
    public var onGoogleLogin: (() -> Void)?
    public var onAppleLogin: (() -> Void)?

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Login") {
                onLogin?(email, password)
            }
            .buttonStyle(.borderedProminent)

            HStack {
                Button("Login with Google") {
                    onGoogleLogin?()
                }
                .buttonStyle(.bordered)

                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        print("Apple login successful: \(authResults)")
                        onAppleLogin?()
                    case .failure(let error):
                        print("Apple login failed: \(error)")
                    }
                }
                .frame(height: 44)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
