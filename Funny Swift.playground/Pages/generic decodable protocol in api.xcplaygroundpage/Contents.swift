import Foundation

// API

enum DataError: Error {
    case internet(Error)
    case invalidResponse
    case invalidData
    case decoding
}

typealias ResultCompletion<T> = (Result<T, DataError>) -> Void

protocol API {}

extension API where Self: Decodable {
    
    static func get(from url: URL, completion: @escaping ResultCompletion<Self>) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.internet(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Self.self, from: data)
                completion(.success(decodedData))
            }catch {
                completion(.failure(.decoding))
            }
        }.resume()
    }
}

// Model

struct Animal: Decodable, CustomStringConvertible {
    let name: String
    
    var description: String {
        return "Animal: \(name)"
    }
}

extension Animal: API {}
extension Array: API where Element: Decodable {}

// fetch data from API

let listUrl = URL(string: "https://www.json-generator.com/api/json/get/cgtNBfTPiq")!
[Animal].get(from: listUrl) { result in
    switch result {
    case .failure(let error):
        print(error.localizedDescription)
    case .success(let data):
        print(data)
    }
}

let animalUrl = URL(string: "https://www.json-generator.com/api/json/get/clgXOarile")!
Animal.get(from: animalUrl) { result in
    switch result {
    case .failure(let error):
        print(error.localizedDescription)
    case .success(let data):
        print(data)
    }
}

// Result on chain

extension Result {
    @discardableResult
    func onSuccess(_ handler: (Success) -> ()) -> Self {
        if case let .success(value) = self { handler(value) }
        return self
    }
    
    @discardableResult
    func onFailure(_ handler: (Failure) -> ()) -> Self {
        if case let .failure(error) = self { handler(error) }
        return self
    }
}

Animal.get(from: animalUrl) { result in
    result.map {
        Animal(name: "Hi \($0.name)")
    }.onSuccess { data in
        print(data)
    }.onFailure { error in
    
    }
}
