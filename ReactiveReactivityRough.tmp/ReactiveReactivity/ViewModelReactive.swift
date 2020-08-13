//
//  ViewModelReactive.swift
//  ReactiveReactivity
//
//  Created by Jerry Ren on 8/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class ReactiveViewModel {
    
    let relayDataSource: BehaviorRelay<[PostInFo]> = BehaviorRelay(value: [])
    var erro: Error?
    let disposeBaggy = DisposeBag()
    
    public func callingAPIFromViewModel(urlString: String) {
        
        let disposable = RxAPIDealer.init().callingAPIFromRxAPIDealer(with: urlString).subscribe(onNext: { (data) in
            do {
                if let data = data {
                    let postInfoArray = try JSONDecoder().decode([PostInFo].self, from: data)
                    self.relayDataSource.accept(postInfoArray)
                }
            } catch {
                print("caught ya")
            }
            
        }, onError: { (erro) in
            self.erro = erro
        }, onCompleted: {
            
        }) {
            print("disposed _")
        }
        disposable.disposed(by: disposeBaggy )
    }
}

