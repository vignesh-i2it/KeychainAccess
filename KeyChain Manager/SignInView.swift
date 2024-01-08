//
//  SignInView.swift
//  KeyChain Manager
//
//  Created by Vignesh on 03/01/24.
//

import SwiftUI

struct SignInView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var loggedIn = false
    
    @Binding var activeUsernames: [String]
    @Binding var softDeletedUsernames: [String]
    
    var body: some View {
        NavigationStack{
        VStack{
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(.black.opacity(0.05))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 1)
                )
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(.black.opacity(0.05))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 1)
                )
                .autocapitalization(.none)
            
            NavigationLink(destination: Dashboard(username: $username, activeUsernames: $activeUsernames, softDeletedUsernames: $softDeletedUsernames), isActive: $loggedIn) {
                EmptyView()
            }
            .hidden()
            
            Button("Login") {
                //                if let savedPassword = KeychainService.getPassword(forAccount: username),
                //                   savedPassword == password {
                //                    loggedIn = true
                //                    print("logged in")
                //                    print("password is \(savedPassword)")
                //                } else {
                //                    print("wrong creds")
                //                }
                signIn()
            }.font(.title3)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(.blue)
                .cornerRadius(10)
                .padding()
        }
    }
    }
    
    func signIn() {
        if let storedPassword = KeychainService.getPassword(forAccount: username) {
                if storedPassword == password {
                    loggedIn = true
                    print("Login successful!")
                } else {
                    print("Incorrect password!")
                }
            } else {
                print("Invalid username or account is soft-deleted!")
            }
        }
}

