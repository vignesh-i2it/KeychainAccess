//
//  AppleButtonView.swift
//  SwiftUI SSO
//
//  Created by Vignesh on 09/01/24.
//

import SwiftUI

import Foundation
import AuthenticationServices
import SwiftUI
import UIKit

struct AppleButtonView: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let authorization = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        return authorization
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}

struct AppleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AppleButtonView()
    }
}

