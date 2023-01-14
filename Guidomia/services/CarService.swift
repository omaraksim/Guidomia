//
//  CarService.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

protocol CarServiceProtocol: ServiceProtocol {
    func loadCars(complition: ([Car]) -> ())
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
    
}
