//
//  How_s_The_Weather_App.swift
//  How's The Weather?
//
//  Created by 백대홍 on 2023/02/04.
//

import SwiftUI

@main
struct WeatherAPIApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
