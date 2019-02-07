
import Foundation

struct Friend: Hashable, Equatable {
    var name: String
    var email: String
    
    var hashValue: Int {
        return self.name.hash ^ self.email.hash
    }
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.name == rhs.name && lhs.email == rhs.email
    }
}

var a: Set = [Friend(name: "a", email: "b")]

a.insert(Friend(name: "a", email: "b"))

a
