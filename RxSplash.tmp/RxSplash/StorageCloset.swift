//
//  StorageCloset.swift
//  RxSplash
//
//  Created by Jerry Ren on 8/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UnsplashPhotoPicker

struct StorageCloset {
    
    static let splashAPISecret = "z-f8_40maqGTD26QOVKVuZpexJYcHq_63c3KxYX9HHg"
    static let splashAPIKey = "dT6Atbf_ArwC-QWcaHL-XgvJbgrvRkRBmcBuhSAb74M"
    
    static let splashCelloIdentifier = "splashCello"        
    
}



// MARS: - Random experiments - useful code to cherry pick


class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!

    private var imageDataTask: URLSessionDataTask?
    private static var cache: URLCache = {
        let memoryCapacity = 50 * 1024 * 1024
        let diskCapacity = 100 * 1024 * 1024
        let diskPath = "unsplash"
        
        if #available(iOS 13.0, *) {
            return URLCache(
                memoryCapacity: memoryCapacity,
                diskCapacity: diskCapacity,
                directory: URL(fileURLWithPath: diskPath, isDirectory: true)
            )
        }
        else {
            #if !targetEnvironment(macCatalyst)
            return URLCache(
                memoryCapacity: memoryCapacity,
                diskCapacity: diskCapacity,
                diskPath: diskPath
            )
            #else
            fatalError()
            #endif
        }
    }()

    func downloadPhoto(_ photo: UnsplashPhoto) {
        guard let url = photo.urls[.regular] else { return }

        if let cachedResponse = PhotoCollectionViewCell.cache.cachedResponse(for: URLRequest(url: url)),
            let image = UIImage(data: cachedResponse.data) {
            photoImageView.image = image
            return
        }

        imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }

            strongSelf.imageDataTask = nil

            guard let data = data, let image = UIImage(data: data), error == nil else { return }

            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.photoImageView, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.photoImageView.image = image
                }, completion: nil)
            }
        }

        imageDataTask?.resume()
    }
}

// MARS: - just to wrap trackDownloads( ) around

 class randomClass {

 func trackDownloads(for photos: [UnsplashPhoto]) {
    for photo in photos {
        if let downloadLocationURL = photo.links[.downloadLocation]?.appending(queryItems: [URLQueryItem(name: "client_id", value: StorageCloset.splashAPIKey)]) {
            URLSession.shared.dataTask(with: downloadLocationURL).resume()
        }
    }
}}

extension URL {
    func appending(queryItems: [URLQueryItem]) -> URL {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return self
        }


        var queryDictionary = [String: String]()
        if let queryItems = components.queryItems {
            for item in queryItems {
                queryDictionary[item.name] = item.value
            }
        }

        for item in queryItems {
            queryDictionary[item.name] = item.value
        }

        var newComponents = components
        newComponents.queryItems = queryDictionary.map({ URLQueryItem(name: $0.key, value: $0.value) })

        return newComponents.url ?? self
    }
}
