//
//  ParsableModels.swift
//  SwiftUIParsingPractice
//
//  Created by Jerry Ren on 11/11/20.
//

import Foundation

struct UserInfo: Codable, Identifiable {
  public var userId: Int
  public var id: Int
  public var title: String
  public var completed: Bool
}


//struct Info: Codable {
//    var userId: Int
//    var id: Int
//    var title: String
//    var completed: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case userId = "userId"
//        case id = "id"
//        case title = "title"
//        case completed = "completed"
//    }
//}


