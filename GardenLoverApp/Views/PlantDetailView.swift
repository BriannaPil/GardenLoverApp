//
//  PlantDetailView.swift
//

import SwiftUI

struct PlantDetailView: View {

    let plant: Plant
    @State private var notes: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                Button(action: {}) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color(hex: "#A6E8C1"))
                }
                .padding(.top, 60)

                VStack(spacing: 8) {
                    Text(plant.emoji)
                        .font(.system(size: 100))

                    Text(plant.name)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "#A6E8C1"))
                }

                VStack(alignment: .leading, spacing: 16) {

                    Text("Last Watered")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "#A6E8C1"))

                    Text(plant.lastWatered)
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#A6E8C1").opacity(0.8))

                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 3)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Notes")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color(hex: "#A6E8C1"))

                    TextEditor(text: $notes)
                        .frame(height: 120)
                        .padding()
                        .background(Color(hex: "#FFF8C5"))
                        .cornerRadius(16)
                }

                Button(action: {}) {
                    Text("Update Last Watered")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#A6E8C1"))
                        .cornerRadius(16)
                }

                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .background(Color(hex: "#FFF8C5").ignoresSafeArea())
        .navigationBarHidden(true)
    }
}
