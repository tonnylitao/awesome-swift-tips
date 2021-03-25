import UIKit
import Combine

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel<[User]>()
    
    var cancellables = Set<AnyCancellable>()
    
    func setup() {
        viewModel
            .$state
            .sink { [unowned self] data in
                print("notified", data)
                
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.fetch()
    }
    
    deinit {
        print("vc deinit")
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
    deinit {
        print("vm deinit")
    }
}



let vc = ViewController()
vc.setup()
