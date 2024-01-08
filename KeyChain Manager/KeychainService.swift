//
//  KeychainService.swift
//  KeyChain Manager
//
//  Created by Vignesh on 05/01/24.
//

import Foundation
import Security

struct KeychainService {
    
    private static let service = "YourAppService"

    static func savePassword(account: String, password: String) {
        let passwordData = Data(password.utf8)

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecValueData as String: passwordData,
            kSecAttrIsInvisible as String: false
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        if status == errSecDuplicateItem {
            print("Username already exists")
        } else {
            print("Password saved successfully.")
        }
    }

    static func getPassword(forAccount account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecAttrIsInvisible as String: false
        ]

        var item: CFTypeRef?

        if SecItemCopyMatching(query as CFDictionary, &item) == errSecSuccess {
            if let passwordData = item as? Data,
               let password = String(data: passwordData, encoding: .utf8) {
                return password
            }
        }
        return nil
    }

    static func getActiveUsernames() -> [String] {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitAll,
            kSecReturnAttributes as String: true,
            kSecAttrIsInvisible as String: false
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess, let items = result as? [[String: Any]] else {
            return []
        }

        let usernames = items.compactMap { $0[kSecAttrAccount as String] as? String }
        return usernames
    }
    
    static func getSoftDeletedUsernames() -> [String] {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecReturnAttributes as String: true,
            kSecMatchLimit as String: kSecMatchLimitAll,
            kSecAttrIsInvisible as String: true
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess, let items = result as? [[String: Any]] else {
            return []
        }

        let softDeletedUsernames = items.compactMap { $0[kSecAttrAccount as String] as? String }

        return softDeletedUsernames
    }

    static func activateUsername(account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
        ]

        let attributes: [String: Any] = [
            kSecAttrIsInvisible as String: false
        ]

        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)

        if status == errSecSuccess {
            print("set as visible")
        } else {
            print("Failed to set item to visible with status: \(status)")
        }
    }
    
    static func softDeleteUsername(account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
        ]

        let attributes: [String: Any] = [
            kSecAttrIsInvisible as String: true
        ]

        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)

        if status == errSecSuccess {
            print("set as invisible")
        } else {
            print("Failed to set item to invisible with status: \(status)")
        }
    }    
}
