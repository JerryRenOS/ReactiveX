//
//  StorageCloset.swift
//  ReactiveReactivity
//
//  Created by Jerry Ren on 8/15/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct StorageCloset {
    static let goofballdeveloperKey = "cqgYNwdFsLYkNQyBWXRNGPtKzWuR5NfG"
    
    static let trumpURLForFun = "https://api.giphy.com/v1/gifs/search?api_key=cqgYNwdFsLYkNQyBWXRNGPtKzWuR5NfG&q=trump&limit=13&offset=0&rating=r&lang=en"
    static let tpGifURLForFun = "https://media1.giphy.com/media/xTiTnHXbRoaZ1B1Mo8/giphy.gif?cid=34d60d39orynjwgf8qprshpa5ao1gazvia51sj2nhr7a0rtg&rid=giphy.gif"
}

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



// kim jon en haha
//https://media2.giphy.com/media/3jGewqNYjuPhm/giphy.gif?cid=34d60d39q4ljhjtfumrhp0llsrw9zxzzvrc0dvwiqlzlxcst&rid=giphy.gif

// https://giphy.com/gifs/sbnation-2Fazg4XrLLmoGqwMg
