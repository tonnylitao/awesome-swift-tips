//: [Previous](@previous)

import Foundation
import CoreData

//: easy CoreData in iOS10

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    var errorHandler: (Error) -> Void = {err in
        debugPrint("CoreData error \(err)")
    }
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { [weak self](storeDescription, error) in
            if let error = error {
                self?.errorHandler(error)
            }
        })
        
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        return self.container.viewContext
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        return self.container.newBackgroundContext()
    }()
}

extension CoreDataStack {
    static func performForegroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        let ctx = self.shared.viewContext
        ctx.perform { [unowned ctx] in
            block(ctx)
        }
    }
    
    static func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.shared.container.performBackgroundTask(block)
    }
}

func dashatize(_ number: Int) -> String {
    
    return String(number).characters.reduce("") { (result, char) -> String in
        
        if char == "-" { //negative
            return result
        }
        
        let string = String(char)
        
        
        if Int(String(char))! % 2 == 0 { //even
            
            return result + string
        }else { //odd
            
            if result.hasSuffix("-") {
                return result + string + "-"
            }else {
                return result + "-" + string + "-"
            }
            
        }
    }
    
}




