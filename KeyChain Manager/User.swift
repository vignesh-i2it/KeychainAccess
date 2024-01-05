//
//  User.swift
//  KeyChain Manager
//
//  Created by Vignesh on 05/01/24.
//

import Foundation

struct User: Codable {
    let id: UUID
    let name: String
    let username: String
    let password: String
    let accessGranted: Bool
}
