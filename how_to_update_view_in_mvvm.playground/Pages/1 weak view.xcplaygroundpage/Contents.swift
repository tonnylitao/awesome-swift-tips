import Foundation
import UIKit

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel<[User]>()
    
    func setup() {
        viewModel.tableView = self.tableView
        viewModel.fetch()
    }
}

//ViewModel.swift
class ViewModel<R: Resource> {
    
    var state: R?
    
    weak var tableView: UITableView?
    
    func fetch() {
        
        R.fetch { [weak self] data in
            print("fetched", data)
            
            self?.state = data
            self?.tableView?.reloadData()
        }
    }
}

let vc = ViewController()
vc.setup()
