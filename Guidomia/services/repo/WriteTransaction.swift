//
//  WriteTransaction.swift
//  Guidomia
//
//  Created by omar on 16/1/2023.
//

import RealmSwift

final class WriteTransaction {
    private let realm: Realm
    internal init(realm: Realm) {
        self.realm = realm
    }
    
    func add<T: Persistable>(_ value: T) {
        realm.add(value.managedObject())
    }
    
    func add<T: Persistable>(_ values: [T]) {
        realm.add(values.map{ $0.managedObject() })
    }
}
