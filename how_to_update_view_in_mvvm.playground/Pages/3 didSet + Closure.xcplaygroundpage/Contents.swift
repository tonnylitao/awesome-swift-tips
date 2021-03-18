import Foundation
import UIKit

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel<[User]>()
    
    func setup() {
        viewModel.bind = { [weak self] data in
            print("notified", data)
            
            self?.tableView.reloadData()
        }
        
        viewModel.fetch()
    }
}

//ViewModel.swift
class ViewModel<R: Resource> {
    
    private var state: R? {
        didSet {
            bind?(state)
        }
    }
    
    var bind: ((R?) -> Void)?
    
    func fetch() {
        R.fetch { [weak self] data in
            self?.state = data
        }
    }
}

let vc = ViewController()
vc.setup()
