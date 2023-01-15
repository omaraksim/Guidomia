//
//  CarsViewController.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

class CarsViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    private var carsViewModel = CarsViewModel(carService: CarService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carsViewModel.delegate = self
        self.setupTableView()
        carsViewModel.load()
    }
    
    private func setupTableView(){
        carsTableView.registerCell(type: ThumbnailTableCell.self)
        carsTableView.registerCell(type: CarTableCell.self)
        carsTableView.registerCell(type: FilterCell.self)
        carsTableView.dataSource = self.carsViewModel
        carsTableView.delegate = self
    }
}
extension CarsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            tableView.performBatchUpdates(nil)
        }
    }
    
}

extension CarsViewController: CarsTableEventDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.carsTableView.reloadData()
            if let isVisible = self.carsTableView.indexPathsForVisibleRows?.contains(IndexPath(row: 0, section: 2)), isVisible {
                self.carsTableView.selectRow(at: IndexPath(row: 0, section: 2), animated: true, scrollPosition: .none)
            }
        }
    }
}
