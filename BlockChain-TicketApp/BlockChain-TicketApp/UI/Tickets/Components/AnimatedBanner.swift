//
//  AnimatedBanner.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI

struct AnimatedBanner: View {
    @State private var offset: CGFloat = -200 // Start off-screen on the left

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background color
                Color.blue.opacity(0.2)
                    .edgesIgnoringSafeArea(.horizontal)

                // Animated text
                Text("Eventure")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .offset(x: offset, y: 0) // Animate only along x-axis
                    .onAppear {
                        withAnimation(
                            Animation.linear(duration: 5) // Animation duration
                                .repeatForever(autoreverses: false)
                        ) {
                            offset = geometry.size.width // Move across the screen
                        }
                    }
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    AnimatedBanner()
}

#Preview {
    AnimatedBanner()
}
