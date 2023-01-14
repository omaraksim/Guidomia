//
//  CarsViewModel.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

class CarsViewModel: NSObject {
    private var cars: [CarViewModel] = []
    
    override init() {
        self.cars = Range(1...100).map{ _ in CarViewModel() }
    }
    
}


extension CarsViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return cars.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTableCell.identifier, for: indexPath) as? ThumbnailTableCell {
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CarTableCell.identifier, for: indexPath) as? CarTableCell {
                let viewModel = cars[indexPath.row]
                cell.setup(viewModel: viewModel)
                return cell
            }
        }
        
        
        return UITableViewCell()
    }
    
    
}
