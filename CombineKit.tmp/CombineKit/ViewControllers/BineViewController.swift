//
//  BineViewController.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import UIKit
import Combine

class BineViewController: UIViewController {
    
    var iproductModel: IProductModel? {
        didSet {
            // reload tableview here
            DispatchQueue.main.async {
                self.combTable.reloadData()
            }
        }
    }
    
    // var iproductModel: IProductModel?
    
    let combTable: UITableView = {
        let tblV = UITableView()
        tblV.register(CustomizableCombineCell.self, forCellReuseIdentifier: GloballyApplied.idOfCombineCell)
        return tblV
    }()
    
    var productSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       view.translatesAutoresizingMaskIntoConstraints = false
        fetchingProducts()
        combTable.dataSource = self
        combTable.delegate = self
        
        view.addSubview(combTable)
        view.backgroundColor = .white
        
        combTable.tableFooterView = UIView() // - get rid of the unused bottom part of the table
        
        print(UIFont.familyNames)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        combTableSetUp()
    }
    
    func combTableSetUp() {
        combTable.frame.size.width = view.bounds.width * 0.95
        combTable.frame.size.height = view.bounds.height * 0.89
        
    //    let constraint = combTable.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -100)
   //     constraint.isActive = true

    }
    
    func fetchingProducts() {
        productSubscriber = CombineAPIDealer.init().somePublisher
            .sink(receiveCompletion: { _ in },
                  receiveValue: { iproductModel in
       
                    self.iproductModel = iproductModel
                    print("iproduct trackname is - ", iproductModel.results[0].trackName)
            })
    }
    
    
}
