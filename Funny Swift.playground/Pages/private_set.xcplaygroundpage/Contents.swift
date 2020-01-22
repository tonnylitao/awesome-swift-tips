import Foundation

class MyClass {
    private var age: Int = 12
    
    private(set) var name: String? = "Tonny"
}

let obj = MyClass()

print(obj.name as Any)  //readable

//obj.name = "new name"  //but cannot be updated


