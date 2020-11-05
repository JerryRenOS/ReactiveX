//
//  ParsableModels.swift
//  CombineKit
//
//  Created by Jerry Ren on 11/4/20.
//

import Foundation

struct IProductModel: Codable {
    let results: [ProductResult]
}

struct ProductResult: Codable {
    let trackName: String
    let sellerUrl: String?
    let description: String
}


