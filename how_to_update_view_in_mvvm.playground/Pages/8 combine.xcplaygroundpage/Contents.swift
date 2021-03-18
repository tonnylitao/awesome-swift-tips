import UIKit
import Combine

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel<[User]>()
    
    var cancellables = Set<AnyCancellable>()
    
    func setup() {
        viewModel
            .$state
            .sink { [weak self] data in
                print("notified", data)
                
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.fetch()
    }
}

//ViewModel.swift
class ViewModel<R: Resource> {
    
    @Published var state: R?
    
    func fetch() {
        R.fetch { [weak self] data in
            self?.state = data
        }
    }
}



let vc = ViewController()
vc.setup()
