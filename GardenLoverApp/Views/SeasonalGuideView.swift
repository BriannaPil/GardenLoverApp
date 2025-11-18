//
//  SeasonalGuideView.swift
//

import SwiftUI

struct SeasonalGuideView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                Button(action: {}) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(Color(hex: "#A6E8C1"))
                }
                .padding(.top, 60)

                Text("Seasonal Guide")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color(hex: "#A6E8C1"))

                ForEach(["🌱 Spring", "🌻 Summer", "🍁 Fall", "❄️ Winter"], id: \.self) { season in
                    Text(season)
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(16)
                        .shadow(radius: 3)
                }

                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .background(Color(hex: "#FFF8C5").ignoresSafeArea())
        .navigationBarHidden(true)
    }
}
