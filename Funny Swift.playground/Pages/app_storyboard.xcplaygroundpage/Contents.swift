
import UIKit


enum AppStoryboard : String {
    case main, login
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func viewController<T: UIViewController>(_ className: T.Type) -> T {
        let identifier = "\((className))"
        
        let vc = instance.instantiateViewController(withIdentifier: identifier)
        return vc as! T
    }
    
    func viewController(_ identifier: String) -> UIViewController {
        let vc = instance.instantiateViewController(withIdentifier: identifier)
        return vc
    }
}

class TestVC: UIViewController {
    
}

let vc = AppStoryboard.main.viewController(TestVC.self)
let vc1 = AppStoryboard.main.viewController("TestVC")

