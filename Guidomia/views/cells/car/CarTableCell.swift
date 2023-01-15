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
    @IBOutlet weak var separatorContainer: UIView!
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var prosStack: UIStackView!
    @IBOutlet weak var consLabel: UILabel!
    @IBOutlet weak var consStack: UIStackView!
    @IBOutlet weak var consContainer: UIView!
    @IBOutlet weak var prosContainer: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .lightGray
        self.nameLabel.textColor = .text
        self.priceLabel.textColor = .text
        self.separatorView.backgroundColor = .orange
        self.prosLabel.textColor = .darkGray
        self.consLabel.textColor = .darkGray
    }
    
    
    func setup(viewModel: CarViewModel){
        DispatchQueue.main.async {
            debugPrint(viewModel.thumbnail)
            self.thumbnail.image = UIImage(named: viewModel.thumbnail)
        }
        self.separatorContainer.isHidden = false
        self.nameLabel.text = viewModel.name
        self.priceLabel.text = viewModel.price
        self.setupRating(viewModel.rating)
        self.setupBuckets(pros: viewModel.pros, cons: viewModel.cons)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        self.expandedView.isHidden = !selected
    }
    
    private func setupRating(_ rating: Int){
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
    
    private func setupBuckets(pros: [String], cons: [String]){
        self.prosStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        self.prosStack.isHidden = pros.isEmpty
        self.prosContainer.isHidden = pros.isEmpty
        pros.forEach{ self.appendNewBullet(text: $0, stack: self.prosStack) }
        self.consStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        self.consStack.isHidden = cons.isEmpty
        self.consContainer.isHidden = cons.isEmpty
        cons.forEach{ self.appendNewBullet(text: $0, stack: consStack) }
    }
    
    private func appendNewBullet(text: String, stack: UIStackView){
        let bullet = BulletView(text: text)
        bullet.translatesAutoresizingMaskIntoConstraints = false
        bullet.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stack.addArrangedSubview(bullet)
    }
    
    func hideSeparator() {
        self.separatorContainer.isHidden = true
    }
    
}
