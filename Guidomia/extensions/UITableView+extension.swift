//
//  UITableView+extension.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

extension UITableView {
    
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        register(UINib(nibName: type.identifier, bundle: nil), forCellReuseIdentifier: identifier ?? type.identifier)
    }
}
