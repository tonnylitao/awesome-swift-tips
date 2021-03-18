import Foundation
import UIKit

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel()
    
    func setup() {
        viewModel.addObserver(
            self,
            forKeyPath: #keyPath(ViewModel.state),
            options: [.new],
            context: nil
        )
        
        viewModel.fetch()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(ViewModel.state) {
            let state = change?[.newKey] as? [Admin]
            print("notified", state)
            
            self.tableView.reloadData()
        }
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
