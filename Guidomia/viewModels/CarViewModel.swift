//
//  CarViewModel.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

class CarViewModel {
    
    var name: String {
        return "Alpine Roadster"
    }
    
    var price: String {
        return "Price: 120k"
    }
    
    var rating: UInt {
        return UInt.random(in: 1...5)
    }
}
