/*:
 # @autoclosure
 */

func log(_ bool: Bool) {
    print(bool)
}
log(2>1) //same as log(true)

print("--------")
//: but @autoclosure convert expression to a closure automatically instead of caculated it immediately.

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    print("1")
    
    predicate()
}
logIfTrue(2>1)

print("--------")

logIfTrue(
    {
        print("2")
        return 2>1
    }()
)

//: With @autoclosure, the right-hand operation of && is unnecessary to be caculated when calling.

func and(lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs ? rhs() : false
}

//: Another example

func defaultWithAutoClosure<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

var bool: Bool?
defaultWithAutoClosure(optional: bool, defaultValue: 2>1)

bool ?? (2>1)

//: So, if you want use short-circuit evaluation or reduce calculating, please use @autoclosure.


func print(_ item: @autoclosure () -> Any) {
    #if DEBUG
    Swift.print(item(), terminator: "\n")
    #endif
}

