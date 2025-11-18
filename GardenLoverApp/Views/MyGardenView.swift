//
//  MyGardenView.swift
//

import SwiftUI

struct MyGardenView: View {

    @State private var selectedPlant: Plant? = nil

    let myPlants = [
        Plant(id: 1, name: "Tomato", emoji: "🍅", lastWatered: "2 days ago"),
        Plant(id: 2, name: "Basil", emoji: "🌿", lastWatered: "1 day ago")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                Button(action: { /* dismiss? */ }) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(hex: "#A6E8C1"))
                }
                .padding(.top, 60)

                Text("My Garden")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color(hex: "#A6E8C1"))

                VStack(spacing: 16) {
                    ForEach(myPlants) { plant in

                        Button(action: { selectedPlant = plant }) {
                            HStack {
                                Text(plant.emoji)
                                    .font(.system(size: 52))

                                VStack(alignment: .leading) {
                                    Text(plant.name)
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(Color(hex: "#A6E8C1"))

                                    Text("Last watered: \(plant.lastWatered)")
                                        .foregroundColor(Color(hex: "#A6E8C1").opacity(0.6))
                                        .font(.system(size: 14))
                                }

                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        }
                        .buttonStyle(ScaleButton())
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        .background(Color(hex: "#FFF8C5").ignoresSafeArea())
        .navigationBarHidden(true)
        .background(
            NavigationLink(
                destination: PlantDetailView(plant: selectedPlant ?? myPlants[0]),
                isActive: Binding(
                    get: { selectedPlant != nil },
                    set: { _ in }
                )
            ) { EmptyView() }
        )
    }
}

