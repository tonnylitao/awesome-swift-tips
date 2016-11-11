
import Foundation

//: Equatable

enum Color1: Int {
    case none, sky, red, green, yellow, purple, blue
}

Color1.none == Color1.sky
Color1.sky == Color1.sky


//: override

enum Color2: Int {
    case none, sky, red, green, yellow, purple, blue
    
    //override
    static func <(lhs: Color2, rhs: Color2) -> Bool {
        return (lhs.rawValue < rhs.rawValue)
    }
}

Color2.none < Color2.sky
//Color2.none > Color2.sky //error

//: Comparable

enum Color3: Int, Comparable {
    case none, sky, red, green, yellow, purple, blue
    
    static func <(lhs: Color3, rhs: Color3) -> Bool {
        return (lhs.rawValue < rhs.rawValue)
    }
}

Color3.none < Color3.sky
Color3.none > Color3.sky
