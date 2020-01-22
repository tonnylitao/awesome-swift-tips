import UIKit

extension UIView {
 
    func backgroundColor(_ c: UIColor?) -> Self {
        backgroundColor = c
        return self
    }
    
    func tag(_ t: Int) -> Self {
        tag = t
        return self
    }
    
    //...
}

let view = UIView()
    .backgroundColor(.white)
    .tag(1)


