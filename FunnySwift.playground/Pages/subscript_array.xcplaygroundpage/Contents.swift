import Foundation

extension Array {
    
    subscript(input: [Int]) -> Array {
        get {
            var result = Array()
            result.reserveCapacity(input.count)
            
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            
            return result
        }
        set {
            assert(input.count == newValue.count, "not supported")
            
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

var arr = [1, 2, 3]
arr[[0, 2]]
arr[[0, 2]] = [0, 1]
print(arr)


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

