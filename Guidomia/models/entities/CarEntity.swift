//
//  CarEntity.swift
//  Guidomia
//
//  Created by omar on 16/1/2023.
//

import Foundation
import RealmSwift

final class CarEntity: Object {
    
    @objc dynamic var identifier: String = UUID().uuidString
    @objc dynamic var make: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var customerPrice: Double = 0.0
    @objc dynamic var marketPrice: Double = 0.0
    @objc dynamic var rating: Int = 0
    dynamic var consList: List<String> = List<String>()
    dynamic var prosList: List<String> = List<String>()
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
}
