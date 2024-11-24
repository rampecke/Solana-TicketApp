//
//  LoginScreen.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(Model.self) var model: Model
    
    var body: some View {
        VStack() {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(maxWidth: 300, alignment: .center)
            
            Text("Secure your tickets with confidence.")
                .font(.subheadline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .frame(maxWidth: 300, alignment: .center)
            
            // Google login button
            Button(action: {
                Task {
                    do {
                        try await model.authenticate()
                    } catch {
                        print("Failed to create account: \(error.localizedDescription)")
                        print(error)
                    }
                }
            }) {
                HStack {
                    Image("google") // Use actual Google logo image or SF symbol if available
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text("Sign in with Google")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding()
                .padding(.horizontal,20)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding(.top, 40)
            }
        }
    }
}

#Preview {
    LoginScreen()
}
