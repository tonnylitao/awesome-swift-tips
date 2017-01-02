//: [Previous](@previous)

import Foundation

enum Method : String {
    case get
    case post
    case put
    case delete
}

struct RemoteResouce {
    var host: String
    var path: String
    var method: Method
//    var headers: [String : String]?
    var parameter: [String : Any]?

    init(_ host: String = "api.example.com", _ path: String, _ method: Method, _ parameter: [String: Any]?) {
        self.host = host
        self.path = path
        self.method = method
        self.parameter = parameter
    }
}

//////////////////////////////////////////////////////////////////////

enum ResponseStatusCode : Int {
    case success = 200
    case notFound = 404
    //...
}

struct Response {
    var code: ResponseStatusCode
    var message: String?
    
    var data: NSData?
}

let status = Response(code:.success, message:"Hell", data:nil)

//////////////////////////////////////////////////////////////////////

protocol ApiManager {}

extension ApiManager {
    static func request(_ resource: RemoteResouce, success:(Void)->(Void), failure: (Void)->(Void)) {
        
    }
}

struct User: ApiManager {
    
}

User.request(
    RemoteResouce("", "", .get, nil),
    success: {
        
    },
    failure: {
        
    })


