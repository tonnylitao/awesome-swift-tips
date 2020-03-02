import Foundation

extension Dictionary {

    subscript(input: [Key]) -> [Value] {
        get {
            var result = [Value]()
            result.reserveCapacity(input.count)

            for key in input {
                if let value = self[key] {
                    result.append(value)
                }
            }

            return result
        }
        set {
            assert(input.count == newValue.count, "not supported")

            for (index, key) in input.enumerated() {
                self[key] = newValue[index]
            }
        }
    }
}

var dic = ["a": "1", "b":"2", "c": "3"]
dic[["a", "c"]]
dic[["a", "c"]] = ["0", "2"]
print(dic)
