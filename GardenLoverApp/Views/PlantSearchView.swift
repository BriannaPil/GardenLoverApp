//
//  PlantSearchView.swift
//

import SwiftUI

struct PlantSearchView: View {

    @State private var searchText = ""
    @State private var selectedPlant: Plant? = nil

    let plants = [
        Plant(id: 1, name: "Tomato", emoji: "🍅", lastWatered: "2 days ago"),
        Plant(id: 2, name: "Basil", emoji: "🌿", lastWatered: "1 day ago"),
        Plant(id: 3, name: "Sunflower", emoji: "🌻", lastWatered: "3 days ago")
    ]

    var filteredPlants: [Plant] {
        if searchText.isEmpty { return plants }
        return plants.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Button(action: { /* dismiss? */ }) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                        Text("Back")
                            .font(.system(size: 17, weight: .semibold))
                    }
                    .foregroundColor(Color(hex: "#A6E8C1"))
                }
                .padding(.top, 60)

                Text("Search Plants")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color(hex: "#A6E8C1"))
                    .padding(.bottom, 8)

                TextField("Search for a plant…", text: $searchText)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 3)

                VStack(spacing: 12) {
                    ForEach(filteredPlants) { plant in
                        Button(action: { selectedPlant = plant }) {
                            HStack(spacing: 16) {
                                Text(plant.emoji)
                                    .font(.system(size: 40))

                                VStack(alignment: .leading) {
                                    Text(plant.name)
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(Color(hex: "#A6E8C1"))

                                    Text("Tap to check suitability")
                                        .foregroundColor(Color(hex: "#A6E8C1").opacity(0.6))
                                        .font(.system(size: 13))
                                }

                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(radius: 2)
                        }
                        .buttonStyle(ScaleButton())
                    }
                }
                .padding(.top, 8)
            }
            .padding(.horizontal, 24)
        }
        .background(Color(hex: "#FFF8C5").ignoresSafeArea())
        .navigationBarHidden(true)
        .background(
            NavigationLink(
                destination: SuitabilityView(plantName: selectedPlant?.name ?? "Tomato",
                                             zipCode: "00000"),
                isActive: Binding(
                    get: { selectedPlant != nil },
                    set: { _ in }
                )
            ) {
                EmptyView()
            }
        )
    }
}
