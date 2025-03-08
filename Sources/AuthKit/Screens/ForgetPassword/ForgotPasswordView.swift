//
//  ForgotPasswordView.swift
//  AuthKit
//
//  Created by Aydın Sarıcan on 8.03.2025.
//

import SwiftUI

public struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showSuccessMessage = false
    @State private var errorMessage: String?

    public var onResetPassword: ((String) -> Void)?

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Text("Forgot Password")
                .font(.largeTitle)
                .bold()

            Text("Enter your email to reset your password.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Reset Password") {
                guard !email.isEmpty else {
                    errorMessage = "Please enter a valid email."
                    return
                }
                onResetPassword?(email)
            }
            .buttonStyle(.borderedProminent)
            .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.callout)
            }

            if showSuccessMessage {
                Text("A password reset link has been sent to your email.")
                    .foregroundColor(.green)
                    .font(.callout)
            }
        }
        .padding()
    }
}

#Preview {
    ForgotPasswordView()
}
