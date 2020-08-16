//
//  GiphyModeru.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

// just trim it down to what I need would be enough honestly
struct GiphyModeruBigBoss: Codable {
    let data: [GiphyModeru]
}

struct GiphyModeru: Codable {
    let images: Images
}

struct Images: Codable {
    let original: Original
}

struct Original: Codable {
    let url: String
}
           
// for debugtion
// https://app.quicktype.io/
