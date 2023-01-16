//
//  CarsViewModel.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

protocol CarsTableEventDelegate: AnyObject{
    func reloadData()
}

class CarsViewModel: NSObject {
    
    private let carService: CarServiceProtocol
    
    init(carService: CarServiceProtocol) {
        self.carService = carService
    }
    
    private var cars: [CarViewModel] = []
    private(set) var models: [String] = []
    private(set) var makes: [String] = []

    private(set) var filter = FilterViewModel()
    
    weak var delegate: CarsTableEventDelegate?
    
    func load(){
        self.carService.findAll { [weak self] savedCars in
            guard let strong = self else { return }
            if savedCars.isEmpty {
                strong.loadFromFile()
            }else{
                strong.updateData(savedCars)
                strong.delegate?.reloadData()
            }
        }
    }
    
    private func loadFromFile(){
        self.carService.loadCars { [weak self] cars in
            guard let strong = self else { return }
            strong.updateData(cars)
            strong.carService.save(cars: cars, complition: nil)
            strong.delegate?.reloadData()
        }
    }
    
    
    private func updateData(_ cars: [Car]){
        self.cars = cars.map{ CarViewModel(car: $0) }
        self.models = cars.map { $0.model }
        self.makes = cars.map { $0.make }
    }
    
}

extension CarsViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case CarScreenSection.thumbnail.rawValue, CarScreenSection.filter.rawValue:
            return 1
        default:
            let filteredCars = filter.filter(items: self.cars)
            return filteredCars.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filteredCars = filter.filter(items: self.cars)

        switch indexPath.section {
        case CarScreenSection.thumbnail.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTableCell.identifier, for: indexPath) as? ThumbnailTableCell {
                return cell
            }
        case CarScreenSection.filter.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FilterCell.identifier, for: indexPath) as? FilterCell {
                cell.delegate = self
                cell.setup(viewModel: self)
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CarTableCell.identifier, for: indexPath) as? CarTableCell {
                let viewModel = filteredCars[indexPath.row]
                cell.setup(viewModel: viewModel)
                if tableView.isLast(for: indexPath) {
                    cell.hideSeparator()
                }
                return cell
            }
        }
        
        
        return UITableViewCell()
    }
    
    
}



extension CarsViewModel: FilterCellDelegate {
    func didSelectModel(model: String?) {
        filter.model = model
        self.delegate?.reloadData()
    }
    func didSelectMake(make: String?) {
        filter.make = make
        self.delegate?.reloadData()
    }
}
