/*:
 # Currying
 
 A currying function in Swift recieves one parameter and return another function. But in other programming languages, it's more flexible and complex, you could treat it having mutiple parameters.
 */

func curried(x: Int) -> (Int) -> Int {
    return { y -> Int in
        return x + y
    }
}

let add1 = curried(x: 1)
add1(2)  //3

//: Or a short one

func shortCurried(x: Int) -> (Int) -> Int {
    return { x + $0 }
}

//: Currying is a good way to reduce your repeat code.

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue(2>1)


print([[2]]+[1])
