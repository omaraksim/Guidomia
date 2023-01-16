//
//  Car.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

struct Car: Codable {
    let make: String
    let model: String
    let customerPrice: Double
    let marketPrice: Double
    let consList: [String]
    let prosList: [String]
    let rating: Int
}

extension Car: Persistable {
    public init(managedObject: CarEntity) {
        make = managedObject.make
        model = managedObject.model
        customerPrice = managedObject.customerPrice
        marketPrice = managedObject.marketPrice
        consList = managedObject.consList.map{ $0 }
        prosList = managedObject.prosList.map{ $0 }
        rating = managedObject.rating
    }
    public func managedObject() -> CarEntity {
        let entity = CarEntity()
        entity.make = make
        entity.model = model
        entity.customerPrice = customerPrice
        entity.marketPrice = marketPrice
        entity.consList.append(objectsIn: consList)
        entity.prosList.append(objectsIn: prosList)
        entity.rating = rating
        return entity
    }
}
