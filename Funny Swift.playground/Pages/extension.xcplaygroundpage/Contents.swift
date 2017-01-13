import UIKit

let point = CGPoint(x:10, y:10)

extension CGPoint {
    init(_ x: Int = 0, _ y: Int = 0) {
        self = CGPoint(x: x, y: y)
    }
    
    init(_ x: Double = 0, _ y: Double = 0) {
        self = CGPoint(x: x, y: y)
    }
}

let p10 = CGPoint(10, 10.1)


//:
let r = CGRect(x: 10, y: 10, width: 100, height: 100)

extension CGRect {
    init(_ x: Int = 0, _ y: Int = 0, _ width: Int = 0, _ height: Int = 0) {
        self = CGRect(x: x, y: y, width: width, height: height)
    }
    
    init(_ x: Double = 0, _ y: Double = 0, _ width: Double = 0, _ height: Double = 0) {
        self = CGRect(x: x, y: y, width: width, height: height)
    }
}

let r1 = CGRect(10, 10, 100, 100)
