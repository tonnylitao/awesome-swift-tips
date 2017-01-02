# The Dao Of Protocol
In Chinese culture, Dao describes a fairyland where nothing is everything, everything is nothing. It's empty but rich, still but transformable.  
How about using **Dao** in Swift programming?

###With Dao in mind

```swift
protocol Dao {}
```
###Extend God

```swift
extension NSObject: Dao {}
```
###Extend `Subworld`
* Initializer with closure

```swift
extension Dao where Self : NSObject {
    
    typealias ConfigClosure = (Self) -> Void
    
    init(_ closures: ConfigClosure...) {
        self.init()
        
        closures.forEach {
            $0(self)
        }
    }   
}
```

###How to use it?

```swift
let btn = UIButton() {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}
print(btn)

//or 
let simplifyBtn = UIButton {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}
print(simplifyBtn)
 
let dic = NSMutableDictionary {
    $0["key"] = 10
}
```


