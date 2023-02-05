//
//  ContentView.swift
//  How's The Weather?
//
//  Created by 백대홍 on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    
    /// 사용할 변수를 Computed Properties로 계산하기.
    // 캘빈 온도를 섭씨 온도로 변경
    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var description: String { network.weather.weather.first?.weatherDescription ?? "" }
    var body: some View {
        VStack {
            Text("온도: \(temp)")
                .padding()
            Text("설명: \(description)")
        }
        .onAppear {
            network.getWeather()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
