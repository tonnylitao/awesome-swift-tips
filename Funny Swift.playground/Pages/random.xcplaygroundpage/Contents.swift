//: CountableRange, CountableClosedRange, Array

import Foundation

extension RandomAccessCollection {
    
    @available(*, deprecated, message: "Swift 4.0 randomElement")
    
    func random() -> Iterator.Element? {
        guard count > 0 else { return nil }

        let offset = arc4random_uniform(numericCast(count))
        let i = index(startIndex, offsetBy: numericCast(offset))
        return self[i]
    }

}

(1..<10).random()
(1...9).random()
["David", "Chris", "Joe", "Jordan", "Tony"].random()

//any random for Range or ClosedRange?
