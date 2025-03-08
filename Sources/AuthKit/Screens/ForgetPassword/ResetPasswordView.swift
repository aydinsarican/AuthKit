//
//  ResetPasswordView.swift
//  AuthKit
//
//  Created by Aydın Sarıcan on 8.03.2025.
//

import SwiftUI

public struct ResetPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    @State private var showSuccessMessage = false

    public var onReset: ((String) -> Void)?

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Text("Reset Password")
                .font(.largeTitle)
                .bold()

            SecureField("New Password", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Set New Password") {
                guard !newPassword.isEmpty, !confirmPassword.isEmpty else {
                    errorMessage = "Please fill in both fields."
                    return
                }

                guard newPassword == confirmPassword else {
                    errorMessage = "Passwords do not match."
                    return
                }

                onReset?(newPassword)
            }
            .buttonStyle(.borderedProminent)
            .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.callout)
            }

            if showSuccessMessage {
                Text("Your password has been reset successfully!")
                    .foregroundColor(.green)
                    .font(.callout)
            }
        }
        .padding()
    }
}


#Preview {
    ResetPasswordView()
}
