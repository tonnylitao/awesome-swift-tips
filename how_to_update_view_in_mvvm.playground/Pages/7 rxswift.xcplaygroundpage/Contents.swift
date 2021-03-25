import Foundation
import UIKit

//ViewController.swift
class ViewController: UITableViewController {
    
    let viewModel = ViewModel<[User]>()
    
    let disposeBag = DisposeBag()
    
    func setup() {
        viewModel
            .state
            .subscribe({ [unowned self] newValue in
                print("notified", newValue)
                
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.fetch()
    }
}

//ViewModel.swift
class ViewModel<R: Resource> {
    
    let state = PublishSubject<R>()
    
    func fetch() {
        R.fetch { [weak self] data in
            self?.state.onNext(data)
        }
    }
}

let vc = ViewController()
vc.setup()
