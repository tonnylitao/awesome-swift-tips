//: Playground - noun: a place where people can play

import UIKit

// KeyboardAvoidable
// original by Roy McKenzie
//https://gist.github.com/yavinfour/35684bf3ae6df02f60a41490a9843008


protocol KeyboardShowAndHideProtocol: class {
    typealias HeightDuration = (height: CGFloat, duration: Double)
    typealias HeightDurationBlock = (HeightDuration) -> Void
    
    
    func addKeyboardObservers(_ block: HeightDurationBlock?)
    
    func removeKeyboardObservers()
    
    var constraintsToAdjust: [NSLayoutConstraint]? { get }
}

var KeyboardShowObserverKey: UInt8 = 0
var KeyboardHideObserverKey: UInt8 = 1

extension KeyboardShowAndHideProtocol where Self: UIViewController {
    
    private var keyboardShowObserver: Any? {
        get {
            return objc_getAssociatedObject(self, &KeyboardShowObserverKey)
        }
        set {
            objc_setAssociatedObject(self, &KeyboardShowObserverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private var keyboardHideObserver: Any? {
        get {
            return objc_getAssociatedObject(self, &KeyboardHideObserverKey)
        }
        set {
            objc_setAssociatedObject(self, &KeyboardHideObserverKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var constraintsToAdjust: [NSLayoutConstraint]? {
        return nil
    }
    
    func addKeyboardObservers(_ block: HeightDurationBlock? = nil) {
        let center = NotificationCenter.default
        
        //keyboard show observer
        keyboardShowObserver = center.addObserver(forName: .UIKeyboardWillShow,
                                                  object: nil,
                                                  queue: nil)
        { [weak self] notification in
            
            guard let strongSelf = self,
                let heightDuration = strongSelf.getHeightDurationFrom(notification: notification) else { return }
            
            if let block = block {
                
                block(heightDuration)
                
            }else if let constraints = strongSelf.constraintsToAdjust {
                
                constraints.forEach { $0.constant = heightDuration.height }
                
                UIView.animate(withDuration: heightDuration.duration){
                    strongSelf.view.layoutIfNeeded()
                }
            }
        }
        
        //keyboard hide observer
        keyboardHideObserver = center.addObserver(forName: .UIKeyboardWillHide,
                                                  object: nil,
                                                  queue: nil)
        { [weak self] notification in
            
            guard let strongSelf = self else { return }
            
            if let block = block {
                
                block((0, 0.25))
                
            }else if let constraints = strongSelf.constraintsToAdjust {
                
                constraints.forEach { $0.constant = 0 }
                
                UIView.animate(withDuration: 0.25) {
                    strongSelf.view.layoutIfNeeded()
                }
            }
        }
    }
    
    private func getHeightDurationFrom(notification: Notification) -> HeightDuration? {
        guard let userInfo = notification.userInfo,
            let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return nil }
        
        return (rect.height, duration)
    }
    
    func removeKeyboardObservers() {
        if let observer = keyboardShowObserver {
            NotificationCenter.default.removeObserver(observer)
        }
        if let observer = keyboardHideObserver {
            NotificationCenter.default.removeObserver(observer)
        }
        keyboardShowObserver = nil
        keyboardHideObserver = nil
    }
}

// Example Implementation
final class NiceViewController: UIViewController {
    
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

extension NiceViewController: KeyboardShowAndHideProtocol {
    
    var constraintsToAdjust: [NSLayoutConstraint]? {
        return [scrollViewBottomConstraint]
    }
}

//Another Example Implementation
final class AnotherViewController: UIViewController, KeyboardShowAndHideProtocol {
    
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addKeyboardObservers { [unowned self] (heightDuration) in
            
            UIView.animate(withDuration: heightDuration.duration, animations: {
                
                if heightDuration.height > 0 { //to show
                    self.scrollViewBottomConstraint.constant = heightDuration.height - 50
                    self.view.layoutIfNeeded()
                }else { //to hide
                    self.scrollViewBottomConstraint.constant = 0
                    self.view.layoutIfNeeded()
                }
            })
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
}
