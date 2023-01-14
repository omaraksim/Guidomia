//
//  BulletView.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

class BulletView: UIView {
    
    private static var NIB_NAME:String = "BulletView"

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var bullet: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    
    private var text: String?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    init(text:String) {
        super.init(frame: .zero)
        self.text = text
        self.setup()
    }
    
    private func setup(){
        let nib = UINib(nibName: Self.NIB_NAME, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        container.frame = bounds
        addSubview(container)
        
        self.bullet.textColor = .orange
        self.textLabel.textColor = .bullet
        self.textLabel.text = self.text
    }
}
