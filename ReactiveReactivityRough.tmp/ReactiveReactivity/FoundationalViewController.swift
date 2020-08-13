//
//  ViewController.swift
//  ReactiveReactivity
//
//  Created by Jerry Ren on 8/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class FoundationalViewController: UIViewController {
     
    let disposeBaggy = DisposeBag()
    let observableSummation = BehaviorRelay<Int>(value: 0)
    let observable = BehaviorRelay<Int>(value: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldRegularWay.delegate = self
        
        bindedTextfield.rx.text.bind(to:bindedLabel.rx.text).disposed(by: disposeBaggy)
    }
    
    @IBOutlet weak var bindedTextfield: UITextField!
    @IBOutlet weak var bindedLabel: UILabel!
    
    @IBOutlet weak var upDownDisplayLabel: UILabel!
    
    @IBOutlet weak var sumOneTextfield: UITextField!
    @IBOutlet weak var sumTwoTextfield: UITextField!
    @IBOutlet weak var summedLabel: UILabel!
      
    
    @IBAction func downAction(_ sender: UIButton) {
        observable.accept(observable.value - 1)
    }
    
    @IBAction func upAction(_ sender: UIButton) {
        observable.accept(observable.value + 1)
    }
    
    @IBAction func summationAction(_ sender: UIButton) {
        
        guard let sumComponentOne = sumOneTextfield.text, let sumComponentTwo = sumTwoTextfield.text, let sumIntOne = Int(sumComponentOne), let sumIntTwo = Int(sumComponentTwo)
            else { print("probs didn't enter valid numbers")
            return }    
        
        observableSummation.accept(sumIntTwo + sumIntOne)
    }
       
    func behaviorRelayTarget() {
        
        observable.subscribe(onNext: { (val) in
            print(val)
            self.upDownDisplayLabel.text = String(val)
        }, onError: { (erro) in
            print(erro)
        }, onCompleted: {
            print("Completed")
        }) {
            // about to release from memory
        }.disposed(by: disposeBaggy)
    }
    
    func behaviorRelaySummation() {
        
        observableSummation.subscribe(onNext: { (va) in
            print(va)
            self.summedLabel.text = "\(va)"
        }, onError: { (erro) in
            print(erro)
        }, onCompleted: {
            print("completed")
        }) {
            
        }
    .disposed(by: disposeBaggy)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        behaviorRelayTarget()
        behaviorRelaySummation()
    }
    
    // MARS: - Syncing textfield with label Regular Way
    @IBOutlet weak var displayRegularWay: UILabel!

    @IBOutlet weak var textfieldRegularWay: UITextField!
}

extension FoundationalViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let targetLabelText = textfieldRegularWay.text {
            displayRegularWay.text = targetLabelText
        }
        return true
    }
    
}

