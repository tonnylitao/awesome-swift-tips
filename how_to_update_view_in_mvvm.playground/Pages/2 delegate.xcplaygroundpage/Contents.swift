import UIKit

//ViewController.swift
class ViewController: UITableViewController, Delegate {
    
    let viewModel = ViewModel<[User]>()
    
    func setup() {
        viewModel.delegate = self
        viewModel.fetch()
    }
    
    func didFetched() {
        print("fetched", viewModel.state)
        
        tableView.reloadData()
    }
}

//ViewModel.swift
protocol Delegate: AnyObject {
    func didFetched()
}

class ViewModel<R: Resource> {
    
    weak var delegate: Delegate?
    
    var state: R?
    
    func fetch() {
        R.fetch { [weak self] data in
            self?.state = data
            self?.delegate?.didFetched()
        }
    }
}

let vc = ViewController()
vc.setup()
