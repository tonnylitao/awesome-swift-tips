//: [Previous](@previous)

import Foundation
import UIKit

extension UIColor {
    
    enum HexColor: String {
        case nav = "#990123"
        case dark = "#990121"
        //... more colors in your theme
    }
    
    static func appColor(_ color: HexColor) -> UIColor {
        return .red //UIColor extension UIColor.hex(color.rawValue)
    }
}

let color: UIColor = .appColor(.nav)
