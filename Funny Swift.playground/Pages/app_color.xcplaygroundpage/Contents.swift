//: [Previous](@previous)

import Foundation
import UIKit
//import Color

extension UIColor {
    
    enum AppColor: String {
        case nav = "#990123"
        case dark = "#990121"
    }
    
    class func appColor(_ color: AppColor) -> UIColor {
        return .red //UIColor.hexColor(color.rawValue)
    }
}

let color: UIColor = .appColor(.nav)
