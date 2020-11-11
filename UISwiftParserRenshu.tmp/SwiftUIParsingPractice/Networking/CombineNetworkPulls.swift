//
//  CombineNetworkPulls.swift
//  SwiftUIParsingPractice
//
//  Created by Jerry Ren on 11/11/20.
//

import Foundation
import Combine

class CombineAPIDealer {
    let urlString = GloballyApplied.targetURL

    var somePublisher: AnyPublisher<[UserInfo], Error> {
        let url = URL(string: urlString)
        print(url) // safely unwrap this later
        let combinedDecoded = URLSession.shared.dataTaskPublisher(for: url!).map { $0.data}
            .decode(type: [UserInfo].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()

        return combinedDecoded
    }
}



