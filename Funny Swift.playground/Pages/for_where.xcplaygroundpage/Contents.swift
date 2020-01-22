import Foundation

var minValue = Int.max

let arr = [3, 2, 1]

for i in arr {
    if i < minValue {
        minValue = i
    }
}


minValue = Int.max

for value in arr where value < minValue {
    print(value)
    
    minValue = value
}
