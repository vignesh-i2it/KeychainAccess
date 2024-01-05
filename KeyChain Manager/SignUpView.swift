//
//  SignUpView.swift
//  KeyChain Manager
//
//  Created by Vignesh on 03/01/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            Text("Register")
                .font(.largeTitle)
                .bold()
                .padding()
            
            TextField("Name", text: $name)
                .padding()
                .frame(width: 300, height: 50)
                .background(.black.opacity(0.05))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 1)
                )
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
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
            
                                           
            Button("Register") {
                let newUser = User(name: name, username: username, password: password)
                                KeychainService.saveUser(newUser)
            }.font(.title3)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(.blue)
                .cornerRadius(10)
                .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
