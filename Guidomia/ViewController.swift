//
//  ViewController.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView(){
        carsTableView.registerCell(type: ThumbnailTableCell.self)
        carsTableView.dataSource = self
        carsTableView.delegate = self
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTableCell.identifier, for: indexPath) as? ThumbnailTableCell {
            return cell
        }
        return UITableViewCell()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return UITableView.automaticDimension
    }
    
}
