//
//  HomeView.swift
//

import SwiftUI

struct HomeView: View {

    @State private var zipCode = ""
    @State private var navigateTo: String? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {

                    // Header
                    VStack(spacing: 4) {
                        Text("GardenLover")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color(hex: "#A6E8C1"))
                            .padding(.top, 80)

                        Text("Your simple gardening companion")
                            .foregroundColor(Color(hex: "#A6E8C1").opacity(0.7))
                    }
                    .padding(.bottom, 16)

                    // ZIP Code Card
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Enter ZIP Code")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(hex: "#A6E8C1"))

                        TextField("90210", text: $zipCode)
                            .padding()
                            .background(Color(hex: "#FFF8C5"))
                            .cornerRadius(16)
                            .multilineTextAlignment(.center)

                        Button("📍 Use My Location") {
                            // TODO: Use location
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#A6E8C1"))
                        .cornerRadius(16)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(24)
                    .shadow(radius: 3)
                    .padding(.horizontal, 24)
                    .padding(.top, 16)

                    // Quick Actions
                    VStack(alignment: .leading, spacing: 16) {

                        Text("Quick Actions")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(hex: "#A6E8C1"))

                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 16), count: 2), spacing: 16) {

                            QuickAction(emoji: "🌱", label: "Check Plant") {
                                navigateTo = "plant"
                            }

                            QuickAction(emoji: "🪴", label: "My Garden") {
                                navigateTo = "garden"
                            }

                            QuickAction(emoji: "📅", label: "Seasonal Guide") {
                                navigateTo = "guide"
                            }

                            QuickAction(emoji: "💧", label: "Watering Tips") {
                                navigateTo = "water"
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 32)

                    Spacer()
                }
            }
            .background(Color(hex: "#FFF8C5").ignoresSafeArea())
            .navigationBarHidden(true)
            .background(
                NavigationLink(destination: nextView(), tag: "plant", selection: $navigateTo) { EmptyView() }
            )
            .background(
                NavigationLink(destination: PlantSearchView(), tag: "plant", selection: $navigateTo) { EmptyView() }
            )
            .background(
                NavigationLink(destination: MyGardenView(), tag: "garden", selection: $navigateTo) { EmptyView() }
            )
            .background(
                NavigationLink(destination: SeasonalGuideView(), tag: "guide", selection: $navigateTo) { EmptyView() }
            )
            .background(
                NavigationLink(destination: WateringTipsView(), tag: "water", selection: $navigateTo) { EmptyView() }
            )
        }
    }

    @ViewBuilder
    func nextView() -> some View {
        PlantSearchView()
    }
}

struct QuickAction: View {
    let emoji: String
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(emoji).font(.system(size: 56))
                Text(label)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color(hex: "#A6E8C1"))
            }
            .frame(maxWidth: .infinity)
            .padding(24)
            .background(.white)
            .cornerRadius(24)
            .shadow(radius: 3)
        }
        .buttonStyle(ScaleButton())
    }
}
