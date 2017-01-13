import Foundation

func synchronized(_ locked: Any, closure: () -> ()) {
    objc_sync_enter(locked)
    closure()
    objc_sync_exit(locked)
}

let a = "a"
synchronized(a) {
    
}
