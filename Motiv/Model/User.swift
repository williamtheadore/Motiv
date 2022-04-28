//
//  User.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import Foundation

struct User: Decodable, Hashable {
    

    
    let uid: String
    let name: String
    let username: String
    let program: String
    let school: School
    let friends: [String]
    let requests: [String]
    let houseUID: String
    
    
}
