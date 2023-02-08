//
//  Network.swift
//  How's The Weather?
//
//  Created by 백대홍 on 2023/02/05.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var weather: Welcome = Welcome.sample
    
    var apiKey = "95515142c1130248c00794ab5df8dda5"
   
    func getWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Jinju,kr&appid=\(apiKey)") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
         
         // Task 만들기
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

              // 응답 상태코드가 200(성공)일 경우에만 디코딩
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedWeather = try JSONDecoder().decode(Welcome.self, from: data)
                        self.weather = decodedWeather
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
         // Task 수행하기
        dataTask.resume()
    }
}
