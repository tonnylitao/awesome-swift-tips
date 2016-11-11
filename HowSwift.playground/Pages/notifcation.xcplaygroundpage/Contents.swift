import Foundation

extension Notification.Name {
    static let changed = NSNotification.Name(rawValue: "changed")
}

extension Selector {
    static let changedSelector = #selector(A.changed(noti:))
}

class A {
    init() {
        NotificationCenter.default.addObserver(self, selector: .changedSelector, name: .changed, object: nil)
    }
    
    @objc func changed(noti: Notification) {
        print("hello")
    }
}

let a = A()

NotificationCenter.default.post(name: .changed, object: nil)