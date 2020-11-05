//
//  CombineDataSourceViewController.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import UIKit
import Combine
import Foundation
// import CombineDataSources

class CombineDataSourceViewController: UIViewController {
    
    let testProductResult = [ProductResult(trackName: "trac", sellerUrl: "sella", description: "descrp")]
    var cancellableSubscriptions = [AnyCancellable]()
    
    let testData = PassthroughSubject<IProductModel, Never>()
    let testTableView = UITableView()
    
//    let wPublisher = PassthroughSubject<Int, wErro>()
//    @Published var propWrap: Bool = false
//    private var subscriberDisposeBaggable: AnyCancellable?
    
    func someKindaSetup() {
       // testData.subscribe(<#T##subscriber: Subscriber##Subscriber#>)
   //     testData.subscribe(testTableView.rowsSubscriber)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        someKindaSetup()
    }
}

enum wErro: Error {
     case abandonedfornow
}

