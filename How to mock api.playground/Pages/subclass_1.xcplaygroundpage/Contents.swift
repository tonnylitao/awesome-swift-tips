import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

class APIClient {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getUserBy(
        id: Int,
        completionHandler: @escaping CompletionHandler
    ) {
        let url = URL(string: "https://example.com/api/user/\(id)")!
        let task = session.dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}

class MockingURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

class MockingURLSession: URLSession {
    var data: Data?
    var error: Error?
    
    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> URLSessionDataTask {
        return MockingURLSessionDataTask {
            completionHandler(self.data, nil, self.error)
        }
    }
}

let mockingSession = MockingURLSession()
mockingSession.data = "{\"id\": 1}".data(using: .utf8)

let client = APIClient(session: mockingSession)
client.getUserBy(id: 1) { data, response, error in
    print(String(data: data!, encoding: .utf8)!)
}
