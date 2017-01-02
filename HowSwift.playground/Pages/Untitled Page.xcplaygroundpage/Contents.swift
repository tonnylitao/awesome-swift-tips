//: [Previous](@previous)

import Foundation
import CoreData
import PlaygroundSupport

protocol Dao {}

extension NSManagedObject: Dao {}

extension Dao where Self: NSManagedObject {
    //Generic <Self>
}





PlaygroundPage.current.needsIndefiniteExecution = true

