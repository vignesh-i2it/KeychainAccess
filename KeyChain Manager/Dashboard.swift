//
//  Dashboard.swift
//  KeyChain Manager
//
//  Created by Vignesh on 05/01/24.
//

import SwiftUI

struct Dashboard: View {
    
    @Binding var username: String
    @Binding var activeUsernames: [String]
    @Binding var softDeletedUsernames:[String]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            List {
                Section(header: Text("Active Users")) {
                    ForEach(activeUsernames, id: \.self) { username in
                        HStack {
                            Text(username)
                            Spacer()
                            Button("Deactivate") {
                                KeychainService.softDeleteUsername(account: username)
                                activeUsernames = KeychainService.getActiveUsernames()
                                softDeletedUsernames = KeychainService.getSoftDeletedUsernames()
                            }
                            .foregroundColor(.red)
                        }
                    }
                }
                
                Section(header: Text("Deactivated Users")) {
                    ForEach(softDeletedUsernames, id: \.self) { username in
                        HStack {
                            Text(username)
                            Spacer()
                            Button("Activate") {
                                KeychainService.activateUsername(account: username)
                                activeUsernames = KeychainService.getActiveUsernames()
                                softDeletedUsernames = KeychainService.getSoftDeletedUsernames()
                            }
                            .foregroundColor(.green)
                        }
                    }
                }
            }
            .navigationTitle("Dashboard")
            .listStyle(.automatic)
            .navigationBarItems(trailing:
                Button("Logout") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}
