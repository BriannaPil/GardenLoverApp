//
//  SuitabilityView.swift
//  GardenLoverApp
//
//  Created by student on 11/18/25.
//


//
//  SuitabilityView.swift
//  GardenLover
//
//  Converted from SuitabilityScreen.tsx
//

import SwiftUI

struct SuitabilityView: View {

    @Environment(\.dismiss) var dismiss
    
    let plantName: String
    let zipCode: String
    
    // Mock plant data matching the TSX file
    private let plantData: [String: (emoji: String, suitable: Bool, sunlight: String, watering: String, temperature: String)] = [
        "Tomato": ("🍅", true, "Full sun (6-8 hours)", "Regular, keep soil moist", "65-85°F"),
        "Basil": ("🌿", true, "Full sun (6 hours)", "Moderate, when dry", "70-80°F"),
        "Sunflower": ("🌻", true, "Full sun (6-8 hours)", "Regular watering", "70-78°F")
    ]
    
    // USDA Zone (mock)
    let zone = "9b"

    var body: some View {
        let plant = plantData[plantName] ?? plantData["Tomato"]!
        
        ScrollView {
            VStack(spacing: 0) {
                
                // Green Header
                VStack {
                    // Back button
                    Button(action: { dismiss() }) {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .medium))
                            Text("Back")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .padding(.bottom, 20)
                    }
                    
                    // Plant emoji + title + zone
                    VStack(spacing: 6) {
                        Text(plant.emoji)
                            .font(.system(size: 80))
                        
                        Text(plantName)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)

                        Text("Your zone: USDA \(zone)")
                            .font(.system(size: 15))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.bottom, 32)
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#A6E8C1"))
                .clipShape(RoundedBottom(radius: 32))
                
                // Main Content
                VStack(spacing: 24) {
                    
                    // Suitability Card
                    VStack(alignment: .leading, spacing: 20) {
                        
                        HStack {
                            Text("Suitable for your region?")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color(hex: "#A6E8C1"))

                            Spacer()
                            
                            Text(plant.suitable ? "YES ✓" : "NO ✗")
                                .font(.system(size: 15, weight: .bold))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(
                                    plant.suitable
                                        ? Color(hex: "#A6E8C1")
                                        : Color(hex: "#FFB6C1")
                                )
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        
                        // Sunlight
                        SuitabilityInfo(
                            emoji: "☀️",
                            title: "SUNLIGHT",
                            value: plant.sunlight
                        )
                        
                        // Watering
                        SuitabilityInfo(
                            emoji: "💧",
                            title: "WATERING",
                            value: plant.watering
                        )
                        
                        // Temperature
                        SuitabilityInfo(
                            emoji: "🌡️",
                            title: "TEMPERATURE",
                            value: plant.temperature
                        )
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(radius: 3)
                    
                    // Add to Garden Button
                    Button(action: {
                        print("Added \(plantName) \(plant.emoji) to your garden")
                        dismiss()
                    }) {
                        Text("+ Add to My Garden")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#A6E8C1"))
                            .cornerRadius(16)
                    }
                    .padding(.bottom, 40)
                    
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }
        }
        .background(Color(hex: "#FFF8C5").ignoresSafeArea())
        .navigationBarHidden(true)
    }
}


// MARK: - Suitability Info Block
struct SuitabilityInfo: View {
    var emoji: String
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text("\(emoji) \(title)")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color(hex: "#A6E8C1").opacity(0.6))
                .tracking(0.5)

            Text(value)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "#A6E8C1"))
        }
    }
}


// MARK: - Custom Rounded Bottom Shape
struct RoundedBottom: Shape {
    var radius: CGFloat = 32
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: 0, y: rect.height - radius))
        path.addQuadCurve(
            to: CGPoint(x: radius, y: rect.height),
            control: CGPoint(x: 0, y: rect.height)
        )
        path.addLine(to: CGPoint(x: rect.width - radius, y: rect.height))
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: rect.height - radius),
            control: CGPoint(x: rect.width, y: rect.height)
        )
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
