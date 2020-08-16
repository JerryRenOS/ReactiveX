//
//  JustInCase.swift
//  RxGraphicsInterFi
//
//  Created by Jerry Ren on 8/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

//import Foundation
//
//struct GoofyGiphy: Codable {
//    let data: [TaDa]
//    let pagination: Pagination
//    let meta: Meta
//}
//
//// MARK: - TaDa
//struct TaDa: Codable {
//    let type, id: String
//    let url: String
//    let slug: String
//    let bitlyGIFURL, bitlyURL: String
//    let embedURL: String
//    let username: String
//    let source: String
//    let title, rating, contentURL: String
//    let tags, featuredTags, userTags: [JSONAny]
//    let sourceTLD: String
//    let sourcePostURL: String
//    let isSticker: Int
//    let importDatetime, trendingDatetime: String
//    let images: Images
//    let analyticsResponsePayload: String
//    let analytics: Analytics
//
//    enum CodingKeys: String, CodingKey {
//        case type, id, url, slug
//        case bitlyGIFURL = "bitly_gif_url"
//        case bitlyURL = "bitly_url"
//        case embedURL = "embed_url"
//        case username, source, title, rating
//        case contentURL = "content_url"
//        case tags
//        case featuredTags = "featured_tags"
//        case userTags = "user_tags"
//        case sourceTLD = "source_tld"
//        case sourcePostURL = "source_post_url"
//        case isSticker = "is_sticker"
//        case importDatetime = "import_datetime"
//        case trendingDatetime = "trending_datetime"
//        case images
//        case analyticsResponsePayload = "analytics_response_payload"
//        case analytics
//    }
//}
//
//// MARK: - Analytics
//struct Analytics: Codable {
//    let onload, onclick, onsent: Onclick
//}
//
//// MARK: - Onclick
//struct Onclick: Codable {
//    let url: String
//}
//
//// MARK: - Images
//struct Images: Codable {
//    let original: FixedHeight
//    let downsized, downsizedLarge, downsizedMedium: The480_WStill
//    let downsizedSmall: DownsizedSmall
//    let downsizedStill: The480_WStill
//    let fixedHeight, fixedHeightDownsampled, fixedHeightSmall: FixedHeight
//    let fixedHeightSmallStill, fixedHeightStill: The480_WStill
//    let fixedWidth, fixedWidthDownsampled, fixedWidthSmall: FixedHeight
//    let fixedWidthSmallStill, fixedWidthStill: The480_WStill
//    let looping: Looping
//    let originalStill: The480_WStill
//    let originalMp4, preview: DownsizedSmall
//    let previewGIF, previewWebp, the480WStill: The480_WStill
//
//    enum CodingKeys: String, CodingKey {
//        case original, downsized
//        case downsizedLarge = "downsized_large"
//        case downsizedMedium = "downsized_medium"
//        case downsizedSmall = "downsized_small"
//        case downsizedStill = "downsized_still"
//        case fixedHeight = "fixed_height"
//        case fixedHeightDownsampled = "fixed_height_downsampled"
//        case fixedHeightSmall = "fixed_height_small"
//        case fixedHeightSmallStill = "fixed_height_small_still"
//        case fixedHeightStill = "fixed_height_still"
//        case fixedWidth = "fixed_width"
//        case fixedWidthDownsampled = "fixed_width_downsampled"
//        case fixedWidthSmall = "fixed_width_small"
//        case fixedWidthSmallStill = "fixed_width_small_still"
//        case fixedWidthStill = "fixed_width_still"
//        case looping
//        case originalStill = "original_still"
//        case originalMp4 = "original_mp4"
//        case preview
//        case previewGIF = "preview_gif"
//        case previewWebp = "preview_webp"
//        case the480WStill = "480w_still"
//    }
//}
//
//// MARK: - The480_WStill
//struct The480_WStill: Codable {
//    let height, width, size: String
//    let url: String
//}
//
//// MARK: - DownsizedSmall
//struct DownsizedSmall: Codable {
//    let height, width, mp4Size: String
//    let mp4: String
//
//    enum CodingKeys: String, CodingKey {
//        case height, width
//        case mp4Size = "mp4_size"
//        case mp4
//    }
//}
//
//// MARK: - FixedHeight
//struct FixedHeight: Codable {
//    let height, width, size: String
//    let url: String
//    let mp4Size: String?
//    let mp4: String?
//    let webpSize: String
//    let webp: String
//    let frames, hash: String?
//
//    enum CodingKeys: String, CodingKey {
//        case height, width, size, url
//        case mp4Size = "mp4_size"
//        case mp4
//        case webpSize = "webp_size"
//        case webp, frames, hash
//    }
//}
//
//// MARK: - Looping
//struct Looping: Codable {
//    let mp4Size: String
//    let mp4: String
//
//    enum CodingKeys: String, CodingKey {
//        case mp4Size = "mp4_size"
//        case mp4
//    }
//}
//
//// MARK: - Meta
//struct Meta: Codable {
//    let status: Int
//    let msg, responseID: String
//
//    enum CodingKeys: String, CodingKey {
//        case status, msg
//        case responseID = "response_id"
//    }
//}
//
//// MARK: - Pagination
//struct Pagination: Codable {
//    let totalCount, count, offset: Int
//
//    enum CodingKeys: String, CodingKey {
//        case totalCount = "total_count"
//        case count, offset
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}

