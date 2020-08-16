//
//  ViewController.swift
//  LogInReactiveX
//
//  Created by Jerry Ren on 2/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var enabledLabel: UILabel!
    
    @IBOutlet weak var searchBarLabel: UISearchBar!
    
    var loginViewModel = LogInViewModel()
    let myDisposeBag = DisposeBag()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        _ = emailTextField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.emailText)
        
        // _ = loginViewModel.emailText.bind(to: emailTextField.rx.text)
        // this line is a backwards binding, sorta
        
        _ = loginViewModel.isValid.bind(to: logInButton.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: {
            isValid in
            self.enabledLabel.text = isValid ? "Pass" : "Keep typing"
            self.enabledLabel.textColor = isValid ? .systemGreen : .systemRed
            print("isValid = \(isValid)")
        }).disposed(by: myDisposeBag)
    }
}


