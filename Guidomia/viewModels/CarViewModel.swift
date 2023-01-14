//
//  CarViewModel.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

class CarViewModel {
    
    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var name: String {
        return String(format: "%@ %@", car.make, car.model)
    }
    
    var thumbnail: String {
        String(format: "%@_%@", car.make.lowercased().replacingOccurrences(of: " ", with: "_"), car.model.lowercased().replacingOccurrences(of: " ", with: "_"))
    }
    
    var price: String {
        var formatedPrice = String(format: "%@", car.customerPrice)
        let price = car.customerPrice
        let thousand = price / 1000
        let million = price / 1000000
        if million >= 1.0 {
            formatedPrice = String(format: "%.0fM", round(million*10)/10)
        }
        else if thousand >= 1.0 {
            formatedPrice = String(format: "%.0fK", round(thousand*10)/10)
        }
        
        return String(format: "Price: %@", formatedPrice)
    }
    
    var rating: Int {
        return car.rating
    }
}
