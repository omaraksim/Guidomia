//
//  Container.swift
//  Guidomia
//
//  Created by omar on 16/1/2023.
//

import RealmSwift

final class Container {
    private let realm: Realm
    
    public convenience init() throws {
        try self.init(realm: Realm())
    }
    internal init(realm: Realm) {
        self.realm = realm
    }
    
    func read<T: Object>(identifier: String) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: identifier)
    }
    
    func readAll<T: Object>() -> [T] {
        return Array(realm.objects(T.self))
    }
    
    public func write(_ block: (WriteTransaction) throws -> Void)
    
    throws {
        let transaction = WriteTransaction(realm: realm)
        try realm.write {
            try block(transaction)
        }
    }
}
