import Foundation

class MyClass { }

extension MyClass {
    private static var titleKey: UInt8 = 0
    
    var title: String? {
        get {
            return objc_getAssociatedObject(self, &MyClass.titleKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &MyClass.titleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


let a = MyClass()

a.title = "Swifter.tips"

print(a.title)
