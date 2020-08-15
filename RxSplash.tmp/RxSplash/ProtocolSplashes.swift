//
//  ProtocolSplashes.swift
//  RxSplash
//
//  Created by Jerry Ren on 8/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UnsplashPhotoPicker

protocol UnsplashPhotoPickerDelegate: class { // can change class to nsobject too I beleive
    
  func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker)
  func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto])
    
}
