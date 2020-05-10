import Foundation

enum DataError: Error {
    case internet(Error)
    case invalidResponse
    case invalidData
    case decoding
}

protocol API {
    typealias Completion<T> = (Result<T, DataError>) -> Void
}

extension API where Self: Decodable {
    
    static func get(from url: URL, completion: @escaping Completion<Self>) {
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

struct Animal: Decodable, API, CustomStringConvertible {
    let name: String
    
    var description: String {
        return "Animal: \(name)"
    }
}

extension Array: API where Element: Decodable {}

let listUrl = URL(string: "http://www.json-generator.com/api/json/get/cgtNBfTPiq")!
[Animal].get(from: listUrl) { result in
    switch result {
    case .failure(let error):
        print(error.localizedDescription)
    case .success(let animals):
        print(animals)
        print()
    }
}

let animalUrl = URL(string: "http://www.json-generator.com/api/json/get/clgXOarile")!
Animal.get(from: animalUrl) { result in
    switch result {
    case .failure(let error):
        print(error.localizedDescription)
    case .success(let animal):
        print(animal)
        print()
    }
}

