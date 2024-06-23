//
//  LoginView.swift
//  SwiftUIStudyProject
//
//  Created by 이보라 on 6/22/24.
//

import SwiftUI

struct StyleConstants {
    static let titleFont: Font = .largeTitle
    static let footnoteFont: Font = .footnote
    static let FontWeightBold: Font.Weight = .bold
    static let ColorWhite: Color = .white
    static let ColorBlack: Color = .black
    static let ColorRed: Color = .red
}

struct LoginForm: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            loginHeaderView
            emailPasswordView
            loginButton
            signUpButton
        }
        .padding(50)
    }
    
    @ViewBuilder
    private var loginHeaderView: some View {
        HStack {
            Text("YOUR \nART \nMUSEUM")
                .padding(.bottom, 10)
                .font(StyleConstants.titleFont)
                .fontWeight(StyleConstants.FontWeightBold)
                .foregroundStyle(StyleConstants.ColorWhite)
            Spacer()
        }
        HStack {
            Text("151 3rd St \nSan Francisco, CA 94103")
                .padding(.bottom, 10)
                .font(StyleConstants.footnoteFont)
                .fontWeight(StyleConstants.FontWeightBold)
                .foregroundStyle(StyleConstants.ColorWhite)
            Spacer()
        }
    }
    
    @ViewBuilder
    private var emailPasswordView: some View {
        TextField("Email address", text: $email)
            .padding()
            .background(Color.white)
        
        SecureField("Password", text: $password)
            .padding()
            .background(Color.white)
        
        HStack {
            Spacer()
            Button("Forgot your password?") {
                print("Forgot password tapped")
            }
            .font(StyleConstants.footnoteFont)
            .foregroundStyle(StyleConstants.ColorWhite)
        }
        .padding(.bottom, 50)
    }
    
    private var loginButton: some View {
        Button("Log In") {
            self.isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            CollectionsView()
        })
        .padding()
        .frame(maxWidth: .infinity)
        .background(StyleConstants.ColorRed)
        .fontWeight(StyleConstants.FontWeightBold)
        .foregroundStyle(StyleConstants.ColorWhite)
    }
    
    private var signUpButton: some View {
        Button("Don't have an account?") {
            print("Sign up tapped")
        }
        .padding(.top, 10)
        .font(StyleConstants.footnoteFont)
        .foregroundStyle(StyleConstants.ColorWhite)
    }
}
