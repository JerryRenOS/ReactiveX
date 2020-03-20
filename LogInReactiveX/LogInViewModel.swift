//
//  LogInViewModel.swift
//  LogInReactiveX
//
//  Created by Jerry Ren on 2/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

struct LogInViewModel {
    var emailText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) {
            email, password in
            email.count >= 3 && password.count >= 3 // whatever business logic 
        }
    }
    
    
}
