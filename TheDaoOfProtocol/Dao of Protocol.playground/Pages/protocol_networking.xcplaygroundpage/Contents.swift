//: [Previous](@previous)

import Foundation

enum Method : String {
    case get
    case post
    case put
    case delete
}

struct RemoteResource {
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
    var data: NSData?
}

let status = Response(code:.success, data:nil)

//////////////////////////////////////////////////////////////////////

protocol RemoteFetchable {}

extension RemoteFetchable {
    static func request(_ resource: RemoteResource, success:(Data)->(Void), failure: (Error)->(Void)) {
        //api client send request
    }
}

struct User {
    var name: String
}

extension User: RemoteFetchable { }

User.request(
    RemoteResource("api.example.com", "/user/1", .get, nil),
    success: { data in
        
    },
    failure: { err in
        
    })


