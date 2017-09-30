//please test this file in iOS project

import UIKit

enum AppStoryboard : String {
    case main, login
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    //please test this file in iOS project
    func viewController<T: UIViewController>(_ className: T.Type) -> T? {
        let identifier = "\((className))"
        
        let vc = instance.instantiateViewController(withIdentifier: identifier) //need iOS project
        return vc as? T
    }
    
    //please test this file in iOS project
    func viewController(_ identifier: String) -> UIViewController {
        let vc = instance.instantiateViewController(withIdentifier: identifier) //need iOS project
        return vc
    }
}

class TestVC: UIViewController {
    
}

//please test this file in iOS project
let vc = AppStoryboard.main.viewController(TestVC.self)
let vc1 = AppStoryboard.main.viewController("TestVC")

