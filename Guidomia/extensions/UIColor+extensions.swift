//
//  UIColor+extensions.swift
//  Guidomia
//
//  Created by omar on 14/1/2023.
//

import UIKit

extension UIColor {
    
    
    static var orange: UIColor {
        return UIColor.colorFrom("#FC6016")
    }
    
    static var darkGray: UIColor {
        return UIColor.colorFrom("#858585")
    }
    
    static var lightGray: UIColor {
        return UIColor.colorFrom("#D5D5D5")
    }
    
    static var text: UIColor {
        return UIColor.black.withAlphaComponent(0.45)
    }
    
    static var bullet: UIColor {
        return UIColor.black
    }
    
    
    private static func colorFrom(_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
