//
//  ReactiveViewModel.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/17/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class ReactiveViewModel {
    
    let newRelayedDatasource: BehaviorRelay<GiphyModeruBigBoss> = BehaviorRelay(value: GiphyModeruBigBoss(data: [GiphyModeru(images: Images(original: Original(url: "")))]))  //胡编乱造
    
  //  let relayedDataSource: BehaviorRelay<GiphyModeruBigBoss> = BehaviorRelay(value: GiphyModeruBigBoss(data: [GiphyModeru].init()))  //check this later
    var disposeBaggy = DisposeBag()
    var erro: Error?
    
    public func callingAPIFromReactiveViewModel(urlString: String) {
        
        let disposable = RxAPIDealer.init().callingAPIFromRxAPIDealer(with: urlString).subscribe(onNext: { (data) in
            
            if let data = data {
                
            }
        }, onError: { (erro) in
            self.erro = erro
        }, onCompleted: {
            
        }) {
            
        }
    }
}
