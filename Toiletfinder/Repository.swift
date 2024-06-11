//
//  Repository.swift
//  Toiletfinder
//
//  Created by user on 27.05.24.
//

import Foundation

class Repository: ObservableObject {
    @Published var toiletList = [Toilet]()
    
    init() {
        load()
    }
    
    func load() {
        guard let url = URL(string: "https://data.wien.gv.at/daten/geo?service=WFS&request=GetFeature&version=1.1.0&typeName=ogdwien:WCANLAGE2OGD&srsName=EPSG:4326&outputFormat=json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard error == nil else {
                print("Cannot open URL! System error: \(error!.localizedDescription)")
                return
            }
            
            guard let responseData = data else {
                print("Received data was nil.")
                return
            }
            
            guard let responseString = String(data: responseData, encoding: .utf8) else {
                print("Not UTF-8 valid string.")
                return
            }
            
            print(responseString)
            
            do {
                let toiletModel = try JSONDecoder ().decode(ToiletModel.self, from: responseData)
                
                DispatchQueue.main.async {
                    self.toiletList = toiletModel.features.sorted(by: { $0.district < $1.district})
                }
            } catch {
                print("JSON decoding error!: \(error)")
                return
            }
        }
        task.resume()
    }
    
}
