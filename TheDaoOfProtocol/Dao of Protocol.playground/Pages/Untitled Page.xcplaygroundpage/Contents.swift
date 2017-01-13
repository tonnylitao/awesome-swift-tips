//: [Previous](@previous)

import Foundation
import CoreData
import PlaygroundSupport

protocol Entity {}

extension NSManagedObject: Entity {}

extension Entity where Self: NSManagedObject {
    
}

class User: NSManagedObject {
    
}





PlaygroundPage.current.needsIndefiniteExecution = true

