# The Dao Of Protocol


>In Chinese culture, Dao describes a fairyland where nothing is everything, everything is nothing. It's empty but rich, still but transformable.  
>Protocol-Oriented came out at WWDC2015, it looks like interface in java, but more powerful and flexible. How to use the **Dao** of protocol in Swift programming?


* [Isolate builder code](#isolate-builder-code)
* [Keyboard observer](#keyboard-observer)
* [Default implementation (member method)](#default-implementation-for-member-method)
* [Default implementation (static method)](#default-implementation-for-static-method)
* [Extend for specific generic](#extend-for-specific-generic)

---
## Isolate builder code
It's difficult to read the crowded builder code below. Let's write clean code with the power of Protocol.
```swift
let btn = UIButton()
btn.frame = 
btn.backgroundColor = 
//...more builder code

let txtView = UITextView()
txtView.text =
txtView.layer =
...more builder code

...other builders
```
#### 1. Actually, Dao is empty. But it's the ZEN OF EVERYTHING.

```swift
protocol Dao {}
```
#### 2. Let's extend our existed world to PUT DAO IN MIND.

```swift
extension NSObject: Dao {}
```
#### 3. Add constraints to the `subworld` with protocol extension.

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

#### 4. It seems much more tidy now

```swift
let btn = UIButton() {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
    $0 ...
}

let simplifyBtn = UIButton {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
    $0 ...
}

let dic = NSMutableDictionary {
    $0["key"] = 10
    $0 ...
}
```

#### 5. ridiculous clown?
```swift
var creazyBtn = UIButton({
    //setup property
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
    $0.clipsToBounds = true
    $0.alpha = 0.5
    $0.tintColor = .blue
}, {
    //setup layer
    $0.layer.borderColor = UIColor.yellow.cgColor
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = $0.bounds.width*0.5
}, {
    //setup action
    $0.addTarget(UIViewController(), action: #selector(MyViewController.login(btn:)), for: .touchUpInside)
})
```
---
## Keyboard observer
We had written too much repeated willshow or willhide observers in controller. `Protocol Extension` supports a good solution to solve this problem.

#### 1. create keyboard protocol, but it's only for class.
```swift
protocol KeyboardShowAndHideProtocol: class {
    func addKeyboardObservers(_ block:((height: CGFloat, duration: Double) -> Void)?)
    
    func removeKeyboardObservers()
    
    ..
}
```
#### 2. extend view controller
move all repeat code into protocol extension
```swift
extension KeyboardShowAndHideProtocol where Self: UIViewController {
	
    func addKeyboardObservers(_ block: HeightDurationBlock? = nil) {
        let center = NotificationCenter.default
        
        keyboardShowObserver = center.addObserver(  ...
        
        keyboardHideObserver = center.addObserver(  ...
    }
}
```

#### 3. much better now
The most benifit is code reuse in every controller
```swift
final class ViewController: UIViewController {
    
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
}

extension ViewController: KeyboardShowAndHideProtocol {
    ...
}
```
---
## Default implementation for member method
```swift
protocol Callable { }

extension Callable {
    //default implementation
    func call() {
        print("calling", phone)
    }
}

struct Professor: Callable {
    //'overwrite' call()
    func call() {
        print("calling professor", phone)
    }
}

struct Student: Callable {
    //use the default call()
}
```
---
## Default implementation for static method
Active Record design pattern from ruby is not bad in api case.
```swift
protocol RemoteFetchable {}

extension RemoteFetchable {
    static func request(_ resource: RemoteResouce, success:(Data)->(Void), failure: (Error)->(Void)) {
        //api client send request
    }
}

struct User {
    var name: String
}
```

```swift
extension User: RemoteFetchable { }

User.request(RemoteResouce("api.example.com", "/users", .get, ["gender": "female"]),
    success: { data in
        
    },
    failure: { err in
        
    })
```
---
## Extend for specific generic
How to add extra methods for Int phone?
```swift
protocol Callable {
    associatedtype PhoneNumberType
    var phone: PhoneNumberType { get set }
}

struct Professor: Callable {
    var phone: String
}

struct Student: Callable {
    var phone: Int
}
```
#### just extend protocol for generic
```swift
extension Callable where Self.PhoneNumberType : SignedInteger {
    
    func call() {
        print("this is a number", phone)
    }
}
```

[Download](https://github.com/TonnyTao/HowSwift/archive/master.zip) playground to play

