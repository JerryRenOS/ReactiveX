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


class GraphicsInterFiViewController:  VelocityAnimaController {
    
    @IBOutlet weak var reactiveTeibow: UITableView!

    let disposeBaggy = DisposeBag()

    @IBOutlet weak var imageVPurelyForTestos: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageVPurelyForTestos.image = UIImage.manHandleGIFWithURL("https://media3.giphy.com/media/1hCna4OBhrkit274xj/giphy.gif?cid=34d60d39mfw20jty0hmxk1hrjur4ueezu8ct7sweqpg7rsxw&rid=giphy.gif")
        
        reactiveTeibow.dataSource = self
        reactiveTeibow.delegate = self
    }
}

extension GraphicsInterFiViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cello = reactiveTeibow.dequeueReusableCell(withIdentifier: StorageCloset.rCelloIdentifier, for: indexPath) as? ReactiveCell else { return UITableViewCell() }
        
        return cello
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Nakama"
    }
}
   

   



