//
//  InfoContent.swift
//  Toiletfinder
//
//  Created by User on 10.06.24.
//

import Foundation
import MapKit

class InfoContent: NSObject, MKAnnotation {
    
    let hours: String
    let limitations: String
    let category: String
    let personnel: String
    let coordinate: CLLocationCoordinate2D
        
    init(hours: String, limitations: String, category: String, personnel: String, coordinate: CLLocationCoordinate2D) {
        self.hours = hours
        self.limitations = limitations
        self.category = category
        self.personnel = personnel
        self.coordinate = coordinate
    }
}
