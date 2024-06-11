//
//  DataModel.swift
//  Toiletfinder
//
//  Created by user on 27.05.24.
//

import Foundation
import MapKit

struct ToiletModel: Codable{
    let features: [Toilet]
    
    enum CodingKeys: String, CodingKey {
        case features
    }
}

struct Toilet: Identifiable, Codable {
    let id : String
    let district: Int
    let address: String
    let hours: String?
    let limitations: String?
    let category: String?
    let personnel: String?
    let coordinate: CLLocationCoordinate2D
    
    enum CodingKeys: String, CodingKey{
        case id
        case properties
        case geometry
    }
    
    enum PropertiesCodingKeys: String, CodingKey {
            case district = "BEZIRK"
            case address = "STRASSE"
            case hours = "OEFFNUNGSZEIT"
            case limitations = "EINSCHRAENKUNGEN"
            case category = "KATEGORIE"
            case personnel = "PERSONALBETREUUNG"
        }
        
        enum GeometryCodingKeys: String, CodingKey {
            case coordinates
        }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        
        let propertiesContainer = try container.nestedContainer(keyedBy: PropertiesCodingKeys.self, forKey: .properties)
        self.district = try propertiesContainer.decode(Int.self, forKey: .district)
        self.address = try propertiesContainer.decode(String.self, forKey: .address)
        self.hours = try? propertiesContainer.decode(String.self, forKey: .hours)
        self.limitations = try? propertiesContainer.decode(String.self, forKey: .limitations)
        self.category = try? propertiesContainer.decode(String.self, forKey: .category)
        self.personnel = try? propertiesContainer.decode(String.self, forKey: .personnel)
        
        let geometryContainer = try container.nestedContainer(keyedBy: GeometryCodingKeys.self, forKey: .geometry)
        let coordinates = try geometryContainer.decode([Double].self, forKey: .coordinates)
        self.coordinate = CLLocationCoordinate2D(latitude: coordinates[1], longitude: coordinates[0])
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            
            var propertiesContainer = container.nestedContainer(keyedBy: PropertiesCodingKeys.self, forKey: .properties)
            try propertiesContainer.encode(district, forKey: .district)
            try propertiesContainer.encode(address, forKey: .address)
            try propertiesContainer.encode(hours, forKey: .hours)
            try propertiesContainer.encode(limitations, forKey: .limitations)
            try propertiesContainer.encode(category, forKey: .category)
            try propertiesContainer.encode(personnel, forKey: .personnel)
            
            var geometryContainer = container.nestedContainer(keyedBy: GeometryCodingKeys.self, forKey: .geometry)
            let coordinates = [coordinate.longitude, coordinate.latitude]
            try geometryContainer.encode(coordinates, forKey: .coordinates)
        }
    
}
