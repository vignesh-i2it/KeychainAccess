//
//  SecureStorage.swift
//  KeyChain Manager
//
//  Created by Vignesh on 03/01/24.
//

import Foundation
import KeychainAccess

let userkey = "userSecureKey"

final class SecureStorage {
    
    private static let keychain = Keychain(service: "com.vignesh.KeyChain-Manager")
    
    func save(data: Data, with key: String) async {
        SecureStorage.keychain[data: key]
    }
    
    func get(with key: String) async -> Data? {
        SecureStorage.keychain[data: key]
    }
    
    func delete(with key: String) async {
        SecureStorage.keychain[key] = nil
    }
    
}
