import Foundation
import UIKit

//ViewController.swift
class ViewController: UITableViewController {
    
    @objc let viewModel = ViewModel()
    
    var observer: NSKeyValueObservation?
    
    func setup() {
        observer = observe(\.viewModel.state, options: [.new]) { [weak self] (_, change) in
            print("notified", change.newValue)
            
            self?.tableView.reloadData()
        }
        
        viewModel.fetch()
    }
}


//ViewModel.swift
class ViewModel: NSObject {
    
    @objc dynamic var state: [Admin]?
    
    func fetch() {
        [Admin].fetch { [weak self] data in
            self?.state = data
        }
    }
}

final class Admin: NSObject, Resource {
    required override init() {}
}

let vc = ViewController()
vc.setup()
