//
//  KeychainService.swift
//  KeyChain Manager
//
//  Created by Vignesh on 05/01/24.
//

import Foundation
import KeychainAccess

struct KeychainService {
    static let keychain = Keychain(service: "YourAppService")

    static func saveUser(_ user: User) {
        do {
            try keychain.set(try PropertyListEncoder().encode(user), key: user.username)
        } catch {
            print("Error saving user data to Keychain: \(error.localizedDescription)")
        }
    }

    static func getUser(username: String) -> User? {
        do {
            if let userData = try keychain.getData(username),
               let user = try PropertyListDecoder().decode(User.self, from: userData) {
                return user
            }
        } catch {
            print("Error retrieving user data from Keychain: \(error.localizedDescription)")
        }
        return nil
    }
}
