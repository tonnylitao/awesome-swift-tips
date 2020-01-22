/*:
 # Currying
 
 A currying function in Swift recieves one parameter and return another function. But in other programming languages, it's more flexible and complex, you could treat it having mutiple parameters.
 */

func curried(x: Int) -> (Int) -> Int {
    return { y -> Int in
        return x + y
    }
}

let addOne = curried(x: 1)
addOne(2)  //3

//: Or a short one

func anotherCurried(x: Int) -> (Int) -> Int {
    return { x + $0 }
}
