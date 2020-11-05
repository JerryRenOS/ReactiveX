//
//  CombineNetworkPulls.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import Foundation
import Combine

class CombineAPIDealer {
    private let urlString = GloballyApplied.targetURL
//    guard let url = URL(string: GloballyApplied.targetURL) else
//    { return }
    
    var somePublisher: AnyPublisher<IProductModel, Error> {
        let url = URL(string: urlString)
        print(url) // safely unwrap this later
        let combinedDecoded = URLSession.shared.dataTaskPublisher(for: url!).map { $0.data}
            .decode(type: IProductModel.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()

        return combinedDecoded
    }
}

