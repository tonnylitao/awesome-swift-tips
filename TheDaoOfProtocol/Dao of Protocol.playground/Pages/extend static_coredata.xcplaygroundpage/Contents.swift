
class Earth {}
protocol StopAble {}

extension Earth {
    func stopQuake() {
        
    }
}

// VS

extension StopAble where Self: Earth {
    func stopQuake() {
        
    }
}


////

import Foundation
import PlaygroundSupport

//////////////////////////////////////////////

class Boy {}
//extension Boy {
//    func dateWithLover() {
//        print("💑")
//    }
//}

//////////////////////////////////////////////

class GayBoy: Boy {}
//extension GayBoy {
//    func dateWithLover() {
//        print("💑")
//    }
//}

//////////////////////////////////////////////

protocol DateAble {
    func dateWithLover()
}

extension Boy: DateAble {
    func dateWithLover() {
        print("💑")
    }
}

//extension GayBoy: DateAble {
//    func dateWithLover() {
//        print("💑")
//    }
//}


//////////////////////////////////////////////

//extension Boy: DateAble {}
//extension DateAble where Self: Boy {
//    func dateWithLover() {
//        print("💑")
//    }
//}
//
//extension DateAble where Self: GayBoy {
//    func dateWithLover() {
//        print("👨‍❤️‍👨")
//    }
//}

Boy().dateWithLover() //💑
GayBoy().dateWithLover() //👨‍❤️‍👨

//////////////////////////////////////////////

import CoreData

class User : NSManagedObject {}
class Topic : NSManagedObject {}

protocol ApiFetch {}
protocol CoreDataFetch {}
typealias FetchAble = CoreDataFetch & ApiFetch

extension NSManagedObject : FetchAble {} //it's important

extension CoreDataFetch where Self: NSManagedObject { // ‘where Self: NSManagedObject’ should not be removed
    
    static func localFetch(with id: Int, completion: @escaping ((Self?)->Void) ) {
        // find in coredata
        
        DispatchQueue.main.async {
            completion(Self())
        }
    }
}

User.localFetch(with: 2) { user in }
Topic.localFetch(with: 2) { user in }


extension ApiFetch {
    
    typealias FetchCompletion = (NSData?, Error?) -> Void

    static func remoteFetch(with id: Int, completion: @escaping FetchCompletion) -> URLSessionDataTask {
        
        let path = "api/\(Self.self)/\(id)" // api/User/@{}
        
        //      request from server
        
        DispatchQueue.main.async {
            completion(nil, nil)
        }
        return URLSessionDataTask()
    }
}

extension ApiFetch where Self: User {
    
    static func remoteMe(completion: @escaping ((Self?)->Void) ) {
        
        // find in coredata
        
        DispatchQueue.main.async {
            completion(Self())
        }
    }
}

User.remoteFetch(with: 1) { _, _ in }
Topic.remoteFetch(with: 1) { _, _ in }

User.remoteMe { user in }


PlaygroundPage.current.needsIndefiniteExecution = true;
