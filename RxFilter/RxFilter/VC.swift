//
//  ViewController.swift
//  RxFilter
//
//  Created by Jerry Ren on 3/29/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var vcImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navControl = segue.destination as? UINavigationController else {
            fatalError("Segue got lost in the search for its destination (clue: Nav)")
        }
        guard let picsCVC = navControl.viewControllers.first as? PicsCollectionVC else {
            fatalError("Segue got lost in the search for its destination (clue: collectionVC")
        }
        
        picsCVC.chosenPic.subscribe(onNext: { [weak self] pic in
            self?.vcImageView.image = pic
        })
            .disposed(by: disposeBag)
    }
}


















//   navigationController?.navigationBar.prefersLargeTitles = true

