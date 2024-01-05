//
//  SignInView.swift
//  KeyChain Manager
//
//  Created by Vignesh on 03/01/24.
//

import SwiftUI

struct SignInView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State private var loggedIn = false

    
    var body: some View {
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
            
                                           
            Button("Login") {
                if let user = KeychainService.getUser(username: username),
                                   user.password == password {
                                    loggedIn = true
                              
                    print("logged in")
                                }
            }.font(.title3)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(.blue)
                .cornerRadius(10)
                .padding()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
