//
//  FilterViewModel.swift
//  Guidomia
//
//  Created by omar on 15/1/2023.
//

import Foundation

class FilterViewModel {
    
    var model: String?
    var make: String?
    
    func filter(items: [CarViewModel]) -> [CarViewModel] {
        var filtred:[CarViewModel] = []
        filtred = items.filter{ $0.model == model || model == nil }
        filtred = filtred.filter{ $0.make == make || make == nil}
        return filtred
    }
    
}
