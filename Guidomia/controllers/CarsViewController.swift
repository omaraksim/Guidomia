//
//  CarsViewController.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

class CarsViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    
    var carsViewModel = CarsViewModel(carService: CarService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        carsViewModel.load {
            DispatchQueue.main.async {
                self.carsTableView.reloadData()
                self.carsTableView.selectRow(at: IndexPath(row: 0, section: 1), animated: true, scrollPosition: .top)
            }
        }
    }
    
    private func setupTableView(){
        carsTableView.registerCell(type: ThumbnailTableCell.self)
        carsTableView.registerCell(type: CarTableCell.self)
        carsTableView.dataSource = self.carsViewModel
        carsTableView.delegate = self
    }
}


extension CarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            tableView.performBatchUpdates(nil)
        }
    }
    
}
