//
//  ProfileView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI

struct ProfileView: View {
    @Bindable var profile: Profile
    
    var body: some View {
        HStack {
            // VStack to arrange title and name vertically
            VStack(alignment: .leading, spacing: 5) {
                // Welcome back title
                Text("Welcome back!")
                    .font(.title2) // Larger font for prominence
                    .fontWeight(.semibold) // Bold text
                    .foregroundColor(.primary) // Primary color

                // Profile name
                Text(profile.name)
                    .font(.subheadline) // Smaller font size
                    .foregroundColor(.secondary) // Secondary color
            }
            Spacer()
            
            // Profile Image
            Image(profile.profilePictureUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50) // Size of the profile picture
                .clipShape(Circle()) // Make the image round
                .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // Optional border
                .shadow(radius: 4) // Optional shadow for better visuals
        }.padding() // Padding around the entire HStack for spacing
    }
}

#Preview {
    ProfileView(profile: Profile(name: "Simon Osterlehner", profilePictureUrl: "ExamplePicture")).environment(MockModel() as Model)
}
