//: [Previous](@previous)

import Foundation
import XCTest

// for readable and maintainable,
// to use an alphabet followed by a emoji to replace magic varibles: a0, a1, a2...

fileprivate extension Int {
    static let a🥑 = 1_000_000
    static let b🥦 = 2_000_000
    static let k🥝 = 3_000_000
}

class EmojiTests: XCTestCase {
    
    
    func testDefault() throws {
        XCTAssertEqual(Int.a🥑 + Int.b🥦, Int.k🥝)
    }
}

//: [Next](@next)
