import Foundation
import UIKit

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel<[User]>()
    
    func setup() {
        viewModel.bind { [weak self] data in
            print("notified", data)
            
            self?.tableView.reloadData()
        }
        
        viewModel.fetch()
    }
}

//ViewModel.swift
class ViewModel<R: Resource> {
    
    let state = Box<R>()
    
    func bind(_ listener: @escaping (R?) -> ()) {
        state.listener = listener
    }
    
    func fetch() {
        R.fetch { [weak self] data in
            self?.state.value = data
        }
    }
}

//Box.swift
class Box<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    var listener: ((T?) -> ())?
    
    init(_ v: T? = nil) {
        value = v
    }
}

let vc = ViewController()
vc.setup()
