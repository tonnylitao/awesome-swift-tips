import Foundation

enum DataError: Error {
    case internet(Error)
    case invalidResponse
    case invalidData
    case decoding
}

struct Animal: Decodable {
    let name: String
}

class API {
    typealias Completion<T> = (Result<T, DataError>) -> Void
    
    static func get<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping Completion<T>) {
        
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
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch {
                completion(.failure(.decoding))
            }
        }.resume()
    }

}

let url = URL(string: "http://www.json-generator.com/api/json/get/cgtNBfTPiq?indent=2")!
API.get([Animal].self, from: url) { result in
    switch result {
    case .failure(let error):
        print(error.localizedDescription)
    case .success(let animals):
        print(animals)
    }
}

//API.get(Animal.self, from: url1) { (result: Result<Animal, DataError>) in
//    switch result {
//    case .failure(let error):
//        print(error.localizedDescription)
//    case .success(let animal):
//        print(animal)
//    }
//}
