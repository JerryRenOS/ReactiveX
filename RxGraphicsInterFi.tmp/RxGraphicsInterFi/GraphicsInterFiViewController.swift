//
//  GraphicsInterFiViewController.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class GraphicsInterFiViewController: UIViewController {
    
    let disposeBaggy = DisposeBag()

    @IBOutlet weak var imageVPurelyForTestos: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageVPurelyForTestos.image = UIImage.manHandleGIFWithURL("https://media3.giphy.com/media/1hCna4OBhrkit274xj/giphy.gif?cid=34d60d39mfw20jty0hmxk1hrjur4ueezu8ct7sweqpg7rsxw&rid=giphy.gif")
        
    }
    
}
