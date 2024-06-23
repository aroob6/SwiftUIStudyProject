//
//  ContentView.swift
//  SwiftUIStudyProject
//
//  Created by 이보라 on 6/22/24.
//

import SwiftUI

// Main ContentView
struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            LoginForm(email: $email, password: $password, isPresented: $isPresented)
        }
    }
}



#Preview {
    ContentView()
}
