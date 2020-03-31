//
//  PicsCollectionVC.swift
//  RxFilter
//
//  Created by Jerry Ren on 3/29/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit
import Photos
import RxSwift

class PicsCollectionVC: UICollectionViewController {
    
    private let chosenPicSubject = PublishSubject<UIImage>()
    var chosenPic: Observable<UIImage> {
        return chosenPicSubject.asObservable()
    }

    
    
    private var images = [PHAsset]()
    // protection level to be tinkered with when writing an extension
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePictures()
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedAsset = self.images[indexPath.row]
        PHImageManager.default().requestImage(for: selectedAsset, targetSize: CGSize(width: 300, height: 300), contentMode: .aspectFit, options: nil)
        {
           [weak self] image, information in
            guard let information = information else { return }
             
            let isDegradedImage = information["PHImageResultIsDegradedKey"] as! Bool
            
            if !isDegradedImage {
                if let image = image {
                    self?.chosenPicSubject.onNext(image)
                    self?.dismiss(animated: true, completion: nil)
                }                                                   
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalConstants.reuseIdentifier , for: indexPath) as? PicCellCollect
            else {
                fatalError("PicCollectionVC cell is not found")
        }
        let picAsset = self.images[indexPath.row]
        let defaultManager = PHImageManager.default()
        
        defaultManager.requestImage(for: picAsset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in
            
            DispatchQueue.main.async {
                cell.picImageView.image = image
            }
        }
        return cell
    }
    
    private func populatePictures() {
        
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            if status == .authorized {
                
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { (object, count, stop) in
                    self?.images.append(object)
                }
                self?.images.reverse()
                //       print(self?.images)

                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
            
        }
        
    }
    
    
}

