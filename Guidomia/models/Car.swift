//
//  Car.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

struct Car: Codable {
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating: Int
}
