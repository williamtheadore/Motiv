//
//  House.swift
//  Motiv
//
//  Created by William Little on 2022-06-02.
//

import Foundation
import CoreLocation

struct House: Identifiable {
    
    let id: String
    let houseName: String
    let houseType: String
    let housemates: [User]
    let events: [HouseEvent]
    let motivScore: Int
    let followers: [User]
    let location: CLLocationCoordinate2D
    let address: String
    
}
