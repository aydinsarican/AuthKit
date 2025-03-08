//
//  RegisterView.swift
//  AuthKit
//
//  Created by Aydın Sarıcan on 8.03.2025.
//

import SwiftUI
import AuthenticationServices

public struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    public var onRegister: ((String, String) -> Void)?
    public var onGoogleRegister: (() -> Void)?
    public var onAppleRegister: (() -> Void)?

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Register") {
                onRegister?(email, password)
            }
            .buttonStyle(.borderedProminent)

            HStack {
                Button("Register with Google") {
                    onGoogleRegister?()
                }
                .buttonStyle(.bordered)

                SignInWithAppleButton(.signUp) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        print("Apple register successful: \(authResults)")
                        onAppleRegister?()
                    case .failure(let error):
                        print("Apple register failed: \(error)")
                    }
                }
                .frame(height: 44)
            }
        }
        .padding()
    }
}


#Preview {
    RegisterView()
}
