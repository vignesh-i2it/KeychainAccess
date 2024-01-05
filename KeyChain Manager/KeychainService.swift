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

    static func saveUser(_ user: User) {
        
        let userData = try! JSONEncoder().encode(user)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: user.username,
            kSecValueData as String: userData
        ]
        
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
    
    static func getUser(username: String) -> User? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: username,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        guard status == errSecSuccess,
              let existingItem = item as? Data,
              let user = try? JSONDecoder().decode(User.self, from: existingItem)
        else { return nil }

        return user
    }
    
    
}
