//
//  ContentView.swift
//  KeyChain Manager
//
//  Created by Vignesh on 03/01/24.
//

import SwiftUI

//struct User: Codable {
//    let id: UUID
//    let name: String
//    let username: String
//    let password: String
//}

struct ContentView: View {
    
    @State var activeUsernames = KeychainService.getActiveUsernames()
    @State var softDeletedUsernames = KeychainService.getSoftDeletedUsernames()
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text("KeyChain Manager")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                NavigationLink(destination: SignInView(
                    activeUsernames: $activeUsernames,
                    softDeletedUsernames: $softDeletedUsernames
                )) {
                    Text("Login")
                        .frame(width: 200)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                                
                HStack {
                    Divider()
                        .frame(width: 100).frame(height: 1).background(Color.gray)
                    Text("or")
                        .padding(.horizontal, 10)
                    Divider()
                        .frame(width: 100).frame(height: 1).background(Color.gray)
                }
                .padding(.vertical, 10)
                                
                NavigationLink(destination: SignUpView(
                    activeUsernames: $activeUsernames,
                    softDeletedUsernames: $softDeletedUsernames
                )) {
                    Text("Register")
                        .frame(width: 200)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
