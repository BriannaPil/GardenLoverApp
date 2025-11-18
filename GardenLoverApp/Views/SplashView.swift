//
//  SplashView.swift
//

import SwiftUI

struct SplashView: View {

    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    var onComplete: () -> Void

    var body: some View {
        ZStack {
            Color(hex: "#FFF8C5").ignoresSafeArea()

            VStack(spacing: 12) {
                Text("🌼")
                    .font(.system(size: 120))
                    .scaleEffect(scale)
                    .animation(
                        .easeInOut(duration: 1.0).repeatForever(autoreverses: true),
                        value: scale
                    )

                Text("GardenLover")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(Color(hex: "#A6E8C1"))

                Text("Loading…")
                    .foregroundColor(Color(hex: "#A6E8C1").opacity(0.5))
            }
            .opacity(opacity)
            .onAppear {
                scale = 1.15

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeOut(duration: 0.6)) {
                        opacity = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        onComplete()
                    }
                }
            }
        }
    }
}
