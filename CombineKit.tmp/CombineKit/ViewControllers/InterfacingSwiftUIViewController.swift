//
//  InterfacingSwiftUIViewController.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import UIKit
import SwiftUI

class InterfacingSwiftUIViewController: UIViewController {
    
    fileprivate let contentViewInHost = UIHostingController(rootView: UISwift())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray //
        settingupHostViewCon()
  //      contentViewInHost.view.frame = .init(x: 113, y: 113, width: 113, height: 153)
  //      contentViewInHost.view.layer.masksToBounds = true
        constrainingHostViewCon()
    }
    
    func settingupHostViewCon() {
        self.addChild(contentViewInHost)
        view.addSubview(contentViewInHost.view)
        contentViewInHost.didMove(toParent: self)
    }
    
    func constrainingHostViewCon() {
        //this is for the hostcontroller, not the swiftui view
        contentViewInHost.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewInHost.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        contentViewInHost.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        contentViewInHost.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        contentViewInHost.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
        

}
