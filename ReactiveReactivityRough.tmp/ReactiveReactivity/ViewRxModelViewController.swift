//
//  VReactiveModelViewController.swift
//  ReactiveReactivity
//
//  Created by Jerry Ren on 8/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import RxSwift
import RxCocoa  
import UIKit

class ViewRxModelViewController: UIViewController {

    let disposeBaggy = DisposeBag()
    let reactiveViewModel = ReactiveViewModel.init()
    
    @IBOutlet weak var reactiveTeiBow: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpSubscription()
        bindingRelayDatasource()
    }
    
    func bindingRelayDatasource() {
        reactiveViewModel.relayDataSource.bind(to: self.reactiveTeiBow.rx.items) {
            tableView, row, element in
            let cello = tableView.dequeueReusableCell(withIdentifier: "rxCello")!
            cello.textLabel?.text = "\(element.title)"
            cello.detailTextLabel?.text = " @row \(row)"
            return cello
        }
    .disposed(by: disposeBaggy)
    }
    
    func settingUpSubscription() {
        callingAPI(with: "https://jsonplaceholder.typicode.com/todos/")
    }
    
    func callingAPI(with urlString: String) {
        self.reactiveViewModel.callingAPIFromViewModel(urlString: urlString)
    }

}      
