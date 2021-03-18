
import Foundation

struct Friend: Hashable {
    var name: String
    var email: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(email)
    }
}

var a: Set = [Friend(name: "a", email: "b")]

let (isInserted, _) = a.insert(Friend(name: "a", email: "b"))

isInserted
a
