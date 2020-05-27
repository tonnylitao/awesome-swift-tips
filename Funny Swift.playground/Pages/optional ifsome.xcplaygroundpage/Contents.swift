//: [Previous](@previous)

import Foundation

extension Optional {
    
    /*
     1
     if let a = optional {
     }else {
     }
     
     2
     switch optional {
     case .some(let a) {
     }
     default: break
     }
     
     3
     optional.map {
        
     }
     
     4
     optional.flatMap {
        
     }
     
     --------------------------
     5
     optional.ifSome {
        $0
     }
     
     */
    
    func ifSome(_ transform: (Wrapped) throws -> Void) rethrows {
        try map(transform)
    }
}

//: [Next](@next)
