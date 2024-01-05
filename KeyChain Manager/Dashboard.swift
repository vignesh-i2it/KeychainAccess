//
//  Dashboard.swift
//  KeyChain Manager
//
//  Created by Vignesh on 05/01/24.
//

import SwiftUI

struct Dashboard: View {
    
    @Binding var username: String

    var body: some View {
        NavigationStack{
            Button("Deactivate User") {
                if var user = KeychainService.getUser(username: username) {
                    user.accessGranted = false
                    KeychainService.updateUser(user)
                }
            }
        }
        .navigationTitle("Dashboard")
        
    }
}
