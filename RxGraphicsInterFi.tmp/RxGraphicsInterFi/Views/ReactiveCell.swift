//
//  ReactivityCello.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ReactiveCell: UITableViewCell {

    @IBOutlet weak var reactiveCollectionV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reactiveCollectionV.dataSource = self
        reactiveCollectionV.delegate = self
    }
}
extension ReactiveCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celloc = reactiveCollectionV.dequeueReusableCell(withReuseIdentifier: StorageCloset.rCollectIdentifier, for: indexPath)
        
        return celloc
    }
}

extension ReactiveCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 97) //definitely needs adjustation
    }
}
