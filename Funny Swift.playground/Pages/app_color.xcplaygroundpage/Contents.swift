//: [Previous](@previous)

import Foundation
import UIKit

extension UIColor {
    
    enum ThemeColor: String {
        case nav = "#990123"
        case dark = "#990121"
        //... more colors in your theme
    }
    
    class func appColor(_ color: ThemeColor) -> UIColor {
        return .red //UIColor extension UIColor.hex(color.rawValue)
    }
}

let color = UIColor.appColor(.nav)
