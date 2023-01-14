//
//  CarTableCell.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

class CarTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingStack: UIStackView!
    @IBOutlet weak var separatorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .lightGray
        self.nameLabel.textColor = .text
        self.priceLabel.textColor = .text
        self.separatorView.backgroundColor = .orange
    }
    
    
    func setup(viewModel: CarViewModel){
        self.nameLabel.text = viewModel.name
        self.priceLabel.text = viewModel.price
        self.setupRating(viewModel.rating)
    }
    
    private func setupRating(_ rating: UInt){
        let starWidth:CGFloat = 15
        self.ratingStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for _ in 1...rating {
            let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
            imageView.tintColor = .orange
            self.ratingStack.addArrangedSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: starWidth).isActive = true
        }
    }
    
}
