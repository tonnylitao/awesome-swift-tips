import UIKit
import Foundation

class MockingURLProtocol: URLProtocol {
    static var data: Data?
    static var error: Error?
 
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
 
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
 
    override func startLoading() {
        if let data = Self.data {
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } else if let error = Self.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
 
    override func stopLoading() {}
}
 
MockingURLProtocol.data = "{\"id\": 1}".data(using: .utf8)

// or shared URLSession
URLProtocol.registerClass(MockingURLProtocol.self)
let url = URL(string: "https://www.avanderlee.com/feed/")!
URLSession.shared.dataTask(with: url) { (data, _, error) in
    print(String(data: data!, encoding: .utf8)!)
}.resume()

// or for customised URLSession
let config = URLSessionConfiguration.default
config.protocolClasses = [MockingURLProtocol.self]
URLSession(configuration: config).dataTask(with: URL(string: "https://google")!) { (data, _, error) in
    print(String(data: data!, encoding: .utf8)!)
}.resume()


//class MockingBaseURLProtocol: URLProtocol {
//    var result: Result<Data, Error> {
//        fatalError()
//    }
//
//    override class func canInit(with request: URLRequest) -> Bool {
//        true
//    }
//
//    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
//        request
//    }
//
//    override func startLoading() {
//        switch result {
//        case .success(let data):
//            client?.urlProtocol(self, didLoad: data)
//            client?.urlProtocolDidFinishLoading(self)
//        case .failure(let error):
//            client?.urlProtocol(self, didFailWithError: error)
//        }
//    }
//
//    override func stopLoading() {}
//}
//
//class MockingLoginURLProtocol: MockingBaseURLProtocol {
//    override var result: Result<Data, Error> {
//        .success(Data([1, 2]))
//    }
//}
//
//let config = URLSessionConfiguration.default
//config.protocolClasses = [MockingLoginURLProtocol.self]
//URLSession(configuration: config).dataTask(with: URL(string: "https://google")!) { (data, _, error) in
//    print(data, error)
//}.resume()
