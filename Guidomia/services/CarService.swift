//
//  CarService.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

protocol CarServiceProtocol: ServiceProtocol {
    func loadCars(complition: ([Car]) -> ())
    func findAll(complition: ([Car]) -> ())
    func save(cars: [Car], complition: ((Bool) -> ())?)
}

class CarService: CarServiceProtocol {
    
    
    func loadCars(complition: ([Car]) -> ()) {
        if let file = readLocalFile(forName: "car_list"),
           let cars:[Car] = parse(jsonData: file) {
            complition(cars)
        }else{
            complition([])
        }
    }
    
    func findAll(complition: ([Car]) -> ()){
        do {
            let container = try Container()
            let entities: [CarEntity] = container.readAll()
            complition(entities.map{ Car(managedObject: $0)})
        }catch {
            complition([])
        }
    }
    
    func save(cars: [Car], complition: ((Bool) -> ())? = nil ) {
        do {
            let container = try Container()
            try container.write { transaction in
                transaction.add(cars)
            }
            complition?(true)
        }catch {
            complition?(false)
        }
        
        
    }
    
}
