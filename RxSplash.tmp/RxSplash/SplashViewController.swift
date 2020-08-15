//
//  SplashViewController.swift
//  RxSplash
//
//  Created by Jerry Ren on 8/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import UnsplashPhotoPicker

// potentially have multiple sections - beach / city skyline / dog&cat etc.

class SplashViewController: UIViewController {
    
    let configureSplashRation = UnsplashPhotoPickerConfiguration(accessKey: StorageCloset.splashAPIKey, secretKey: StorageCloset.splashAPISecret, query: "Fiji", allowsMultipleSelection: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     splashyPresentation() // why does calling it in vDL not work though?
          
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        splashyPresentation()
    }
    
    @IBAction func splashActionTest(_ sender: UIButton) {
        
        splashyPresentation()
    }
    
    func splashyPresentation() {
        let splashedPhotoPicker = UnsplashPhotoPicker(configuration: configureSplashRation)
        
 //       splashedPhotoPicker.photoPickerDelegate = self
            
        present(splashedPhotoPicker, animated: true, completion: nil)
    }
}


extension SplashViewController: UnsplashPhotoPickerDelegate {
   
    func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker) {
            print("did cancel called")
    }
    
    func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]) {
        print("photo picker did select called")
    }
}
