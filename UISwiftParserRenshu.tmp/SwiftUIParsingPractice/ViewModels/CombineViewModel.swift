//
//  CombineViewModel.swift
//  SwiftUIParsingPractice
//
//  Created by Jerry Ren on 11/11/20.
//

import Foundation
import Combine
import SwiftUI

class CombineViewModel: ObservableObject {
    
    var infoSubscriber: AnyCancellable?
    @Published var userInfoCollection: [UserInfo] = [] //@published var
    
    func fetchingUserInfo() {
        infoSubscriber = CombineAPIDealer.init().somePublisher
            .sink(receiveCompletion: { (_) in },
                  receiveValue: { (userInfoCollection) in
                    self.userInfoCollection = userInfoCollection
                    print(userInfoCollection[0].completed)
                  })
            }
    init() {
        fetchingUserInfo()
    }
}

