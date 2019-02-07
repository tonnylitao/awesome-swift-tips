/*:
 # @autoclosure
 */

//: @autoclosure attribute convert expression to a closure automatically instead of caculated it immediately.

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}
logIfTrue(2>1) //It's not same as logIfTrue(true)


//: With @autoclosure, the right-hand side of the operation unnecessary to be caculated when calling && function.

func &&(lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs ? rhs() : false
}

//: Another example too.

func ??<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

//: So, if you want use short-circuit evaluation or reduce calculating consumer, please use @autoclosure.
