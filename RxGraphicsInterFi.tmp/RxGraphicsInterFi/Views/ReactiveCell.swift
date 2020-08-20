//
//  ReactivityCello.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ReactiveCell: UITableViewCell {

    @IBOutlet weak var reactiveCollectionV: UICollectionView!

    let reactiveViewModel = ReactiveViewModel.init()
    let disposeBaggy = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        reactiveCollectionV.dataSource = self
        reactiveCollectionV.delegate = self
    }
    
    // MARS: - confusing as heck
    
    func bindingRelayDatasource() {
        reactiveViewModel.newRelayedDatasource.bind(to: self.reactiveCollectionV.rx.items(cellIdentifier: StorageCloset.rCollectIdentifier, cellType: ReactiveCollectionCell.self)) { someInteger, giphyModeruBigBoss, collectionCell in
                                                           // expression type ambiguous without more context smh
        }
    .disposed(by: disposeBaggy)
    }
}

extension ReactiveCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celloc = reactiveCollectionV.dequeueReusableCell(withReuseIdentifier: StorageCloset.rCollectIdentifier, for: indexPath) as! ReactiveCollectionCell
        
        celloc.rxCoGiphyImageView.image = UIImage.manHandleGIFWithURL("https://media3.giphy.com/media/1hCna4OBhrkit274xj/giphy.gif?cid=34d60d39mfw20jty0hmxk1hrjur4ueezu8ct7sweqpg7rsxw&rid=giphy.gif")
        
        return celloc
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
}

extension ReactiveCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 97) //definitely needs adjustation
    }
}
