//please test this file in iOS project

import UIKit

//please test this file in iOS project, rather than in playground

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let login = UIStoryboard(name: "Login", bundle: nil)
}

extension UIStoryboard {
    func viewController<T: UIViewController>(_ className: T.Type, _ identifier: String? = nil) -> T? {
        let iden = identifier ?? "\(className)"
        return instantiateViewController(withIdentifier: iden) as? T
    }
}

class HomeViewController: UIViewController {
    
}

let vc1 = UIStoryboard.main.viewController(HomeViewController.self) //HomeViewController?
let vc2 = UIStoryboard.login.viewController(HomeViewController.self, "HomeViewController_Verion2") //HomeViewController?


//best

extension UIStoryboard {
    
    func viewController(_ identifier: String) -> UIViewController {
        return instantiateViewController(withIdentifier: identifier)
    }
}

let vc5 = UIStoryboard.main.viewController("HomeViewController") as? HomeViewController
let vc6 = UIStoryboard.main.viewController("HomeViewController_Version2") as? HomeViewController
