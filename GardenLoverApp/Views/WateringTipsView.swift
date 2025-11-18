//
//  WateringTipsView.swift
//  GardenLoverApp
//
//  Created by student on 11/18/25.
//


//
//  WateringTipsView.swift
//  GardenLover
//
//  Converted from WateringTipsScreen.tsx
//

import SwiftUI

struct WateringTipsView: View {

    @Environment(\.dismiss) var dismiss
    
    // Matches `shouldWater` mock from TSX
    let shouldWater: Bool = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {

                // BACK BUTTON
                Button(action: { dismiss() }) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                        Text("Back")
                            .font(.system(size: 17, weight: .semibold))
                    }
                    .foregroundColor(Color(hex: "#A6E8C1"))
                }
                .padding(.top, 60)
                .padding(.bottom, 24)

                // HEADER
                HStack {
                    Text("Watering Tips")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "#A6E8C1"))

                    Spacer()

                    Text("💧")
                        .font(.system(size: 40))
                }
                .padding(.bottom, 24)

                // WEATHER CARD
                VStack(alignment: .leading, spacing: 20) {

                    Text("🌤️ Today's Weather")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "#A6E8C1"))

                    VStack(spacing: 16) {

                        WeatherRow(icon: "🌡️", label: "Temperature", value: "72°F")
                        WeatherRow(icon: "💨", label: "Humidity", value: "45%")
                        WeatherRow(icon: "☔", label: "Rain Chance", value: "10%")

                    }

                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 3)
                .padding(.bottom, 20)

                // RECOMMENDATION CARD
                VStack(alignment: .leading, spacing: 12) {

                    Text(shouldWater ? "💧 Water Today!" : "✋ Skip Watering")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)

                    Text(
                        shouldWater
                        ? "Low humidity and no rain expected. Your plants need water today."
                        : "Recent rain and high humidity. Your plants are fine for now."
                    )
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))

                }
                .padding()
                .background(
                    shouldWater
                        ? Color(hex: "#A6E8C1")
                        : Color(hex: "#FFE4B5")
                )
                .cornerRadius(24)
                .shadow(radius: 3)
                .padding(.bottom, 20)

                // GENERAL TIPS CARD
                VStack(alignment: .leading, spacing: 16) {

                    Text("💡 General Watering Tips")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "#A6E8C1"))

                    VStack(alignment: .leading, spacing: 12) {

                        TipRow(icon: "🌅", text: "Water early morning for best absorption")
                        TipRow(icon: "🌊", text: "Water deeply but less frequently")
                        TipRow(icon: "🌱", text: "Check soil moisture 2 inches deep")
                        TipRow(icon: "🍃", text: "Avoid wetting leaves to prevent disease")
                    }

                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .shadow(radius: 3)
                .padding(.bottom, 40)

            }
            .padding(.horizontal, 24)
        }
        .background(Color(hex: "#FFF8C5").ignoresSafeArea())
        .navigationBarHidden(true)
    }
}


// MARK: - Weather Row Component
struct WeatherRow: View {
    var icon: String
    var label: String
    var value: String

    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Text(icon)
                    .font(.system(size: 32))
                Text(label)
                    .font(.system(size: 15))
                    .foregroundColor(Color(hex: "#A6E8C1"))
            }

            Spacer()

            Text(value)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color(hex: "#A6E8C1"))
        }
    }
}


// MARK: - Tip Row Component
struct TipRow: View {
    var icon: String
    var text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(icon)
                .font(.system(size: 20))

            Text(text)
                .font(.system(size: 15))
                .foregroundColor(Color(hex: "#A6E8C1"))
        }
    }
}
