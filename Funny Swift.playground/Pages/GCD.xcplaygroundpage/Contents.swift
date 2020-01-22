import Foundation
import Dispatch
import PlaygroundSupport


//: The most common GCD patterns: run IO operation or compute in background thread then update UI in main thread
DispatchQueue.global().async {
    // Cocurrent thread
    dispatchPrecondition(condition: .notOnQueue(DispatchQueue.main))
    
    DispatchQueue.main.async {
        // Main thread
    }
}

//: Perform mutiple times concurrently
DispatchQueue.concurrentPerform(iterations: 2) { (i) in
    print(i)
}

//: Cancelable block only existed in NSOperation in old times, and before Swift3.0 we have to use complex tricks to implement it in GCD. But now cancelable closure is easy in Swift3.0.

let workItem = DispatchWorkItem { 
    print("a")
}
DispatchQueue.global().async(execute: workItem)

workItem.cancel()

//: dispatch_once is no longer available in Swift. Goodbye, dispatch_once, Hello, globals initialize or static properties.
// Static properties (useful for singletons).
class Object {
    static let sharedInstance = Object()
    
    //or
    static let sharedInstance1 = { () -> Object in
        let obj = Object()
        obj.doSomething()
        return obj
    }()
    
    func doSomething() {
        
    }
}

// Global constant.
let variable: Object = {
    let variable = Object()
    variable.doSomething()
    return variable
}()

//: Delay perform after 3 seconds

DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
    print("World")
}

print("Hello ")

//: Group, parallel

let group1 = DispatchGroup()

group1.enter()
DispatchQueue.global().sync { //remote api fetch
    group1.leave()
}

group1.enter()
DispatchQueue.global().sync { //another remote api fetch
    group1.leave()
}

group1.notify(queue: .main) {
    print("parallel end")
}

//: Group with different queue

let group = DispatchGroup()

let queue1 = DispatchQueue(label: "networking")
let queue2 = DispatchQueue(label: "process")

queue1.async(group: group) {
    
    print("task 1")
}

queue2.async(group: group) {
    
    print("task 2")
}

group.notify(queue: .main) {
    
    print("end")
}

PlaygroundPage.current.needsIndefiniteExecution = true
