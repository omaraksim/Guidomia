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
    
    
    func isLast(for indexPath: IndexPath) -> Bool {
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
}
