//
//  ServiceProtocol.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import Foundation

protocol ServiceProtocol {
    func readLocalFile(forName name: String) -> Data?
    func parse<T: Codable>(jsonData: Data) -> T?
}

extension ServiceProtocol {
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle(for: type(of: self) as! AnyClass).path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
    func parse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decodedObj = try JSONDecoder().decode(T.self, from: jsonData)
            return decodedObj
        } catch let error {
            debugPrint("decode error: \(error)")
            return nil
        }
    }
    
}
