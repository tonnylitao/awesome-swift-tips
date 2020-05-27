//: [Previous](@previous)

import Foundation
import CoreData
import PlaygroundSupport

protocol Entity {}
extension Entity where Self: NSManagedObject {
    //CRUD methods
}

class User: NSManagedObject {
    
}

extension User: Entity {}


PlaygroundPage.current.needsIndefiniteExecution = true

