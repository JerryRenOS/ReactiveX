//
//  RxAPIDealer.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import RxSwift

class RxAPIDealer {
                 
    public func callingAPIFromRxAPIDealer(with urlString: String) -> Observable<Data?> {
        
        Observable<Data?>.create { observer  in
            if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, erro) in
                observer.onNext(data)
                if erro != nil {
                    observer.onError(erro!)
                }
                observer.onCompleted()
                }.resume()
        }
            return Disposables.create()
        }
    }
}




// MARS: - in case that ain't work, try this

//class RxAPIDealer {
//
//    public func callingAPIFromRxAPIDealer(with urlString: String) -> Observable<Data?> {
//
//        Observable<Data?>.create {  observer  in
//            URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, erro) in
//                observer.onNext(data)
//                if erro != nil {
//                    observer.onError(erro!)
//                }
//                observer.onCompleted()
//            }.resume()
//            return Disposables.create()
//        }
//    }
//}
             
