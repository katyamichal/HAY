//
//  Inspiration.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 11.07.2023.
//

import Foundation

struct Inspiration: Codable {
    var inspiration: [InspirationFeed]
}

struct InspirationFeed: Codable {
    let id: Int
    let collectionName: String
    let coverImage: String
    let description: String
    let products: [String]
    // images
    
    enum CodingKeys: String, CodingKey {
        case id, description, products
        case collectionName = "collection_name"
        case coverImage = "cover_image"
    }
    
}
