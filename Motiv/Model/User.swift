//
//  User.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import Foundation

struct User: Decodable, Hashable {
    

    
    let id: String
    let name: String
    let username: String
    let program: String
    let school: String
    let friends: [String]
    let requests: [String]
    let houseUID: String
    let profilePhoto: String
    
}
