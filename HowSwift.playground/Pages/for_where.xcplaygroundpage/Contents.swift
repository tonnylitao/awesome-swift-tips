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

var number = [1, 2]

func threeTimes(number: Int) -> Int {
    let result = 3 * number
    return result
}

number.map(threeTimes)

number.map({
    // Parameter and Return
    (number: Int) -> Int
    
    //keyword in
    in
    
    // Body
    return 3*number
})

