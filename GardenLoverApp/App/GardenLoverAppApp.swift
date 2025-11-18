//
//  GardenLoverAppApp.swift
//

import SwiftUI

@main
struct GardenLoverAppApp: App {

    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView {
                    showSplash = false
                }
            } else {
                HomeView()
            }
        }
    }
}
