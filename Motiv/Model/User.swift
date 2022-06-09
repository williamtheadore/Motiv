//
//  User.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import Foundation

struct User: Decodable, Hashable, Identifiable {
    

    
    let id: String
//    let dateCreated: [String] // Year [0], month [1], day [2], hour [3]
    let name: String
    let username: String
    let program: String
    let school: String
    let friends: [String]
    let requests: [String]
    let houseUID: String
    let profilePhoto: String
    let inHouse: Bool
    
}
