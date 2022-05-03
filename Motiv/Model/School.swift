//
//  School.swift
//  Motiv
//
//  Created by William Little on 2022-04-28.
//

import Foundation
import SwiftUI

struct School: Identifiable {
        
    let id = UUID()
    let image: String
    let logo: String
    let title: String
    let index: Int
    var offset: CGFloat
}
