//
//  Persistable.swift
//  Guidomia
//
//  Created by omar on 16/1/2023.
//

import RealmSwift

protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}
