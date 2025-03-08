//
//  AuthManager.swift
//  AuthKit
//
//  Created by Aydın Sarıcan on 8.03.2025.
//

import Foundation

@MainActor
public class AuthManager {
    public static let shared = AuthManager()

    private init() {}

    public func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        print("Logging in with email: \(email)")
        completion(true)
    }

    public func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        print("Registering with email: \(email)")
        completion(true)
    }

    public func resetPassword(email: String, completion: @escaping (Bool) -> Void) {
        print("Reset password request for: \(email)")
        // Burada backend’e gerçek istek atılabilir
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(true)
        }
    }

    public func updatePassword(newPassword: String, completion: @escaping (Bool) -> Void) {
        print("Updating password")
        // Backend’e yeni şifreyi kaydetme isteği atılabilir
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(true)
        }
    }
}
