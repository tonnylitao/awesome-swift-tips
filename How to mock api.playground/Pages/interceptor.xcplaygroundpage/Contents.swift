import UIKit

typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

class APIClient {
    let session: URLSession
    
    var mockingData: Data?
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getUserBy(
        id: Int,
        completionHandler: @escaping CompletionHandler
    ) {
        if let mockingData = mockingData {
            completionHandler(mockingData, nil, nil)
            return
        }
        
        let url = URL(string: "https://example.com/api/user/\(id)")!
        session.dataTask(with: url, completionHandler: completionHandler)
    }
}

let client = APIClient()
client.mockingData = "{\"id\": 1}".data(using: .utf8)

client.getUserBy(id: 1) { data, response, error in
    print(String(data: data!, encoding: .utf8)!)
}
