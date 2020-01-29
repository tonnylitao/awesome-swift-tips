
class Earth {}
protocol StopAble {}

// extension on class

extension Earth {
    func stopQuake() {
        
    }
}

// VS

// extension on protocol

extension StopAble where Self: Earth {
    func stopQuake() {
        
    }
}


//////////////////////////////////////////////

import CoreData

class User : NSManagedObject {}
class Topic : NSManagedObject {}

protocol RemoteApiFetch {}
protocol LocalCoreDataFetch {}
typealias FetchAble = LocalCoreDataFetch & RemoteApiFetch

extension NSManagedObject : FetchAble {} //it's important

extension LocalCoreDataFetch where Self: NSManagedObject { // ‘where Self: NSManagedObject’ should not be removed
    
    static func localFetch(with id: Int, completion: @escaping ((Self?)->Void) ) {
        // find in coredata
        
        DispatchQueue.main.async {
//            completion(obj)
        }
    }
}

User.localFetch(with: 2) { user in }
Topic.localFetch(with: 2) { user in }


extension RemoteApiFetch {
    
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

extension RemoteApiFetch where Self: User {
    
    static func remoteMe(completion: @escaping ((Self?)->Void) ) {
        
        // find in coredata
        
        DispatchQueue.main.async {
//            completion(user)
        }
    }
}

User.remoteFetch(with: 1) { _, _ in }
Topic.remoteFetch(with: 1) { _, _ in }

User.remoteMe { user in }


