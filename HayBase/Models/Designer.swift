//
//  Designer.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 08.07.2023.
//

import Foundation


struct DesignerResponse: Codable {
    let designers: [Designer]
}

struct Designer: Codable {

    let id: Int
    let designerName: String
    let designerImage: String
    let collectionImages: [String]
    let collectionName: String
    let description: String
    let products: [Product]
    
    
    enum CodingKeys: String, CodingKey {
        case id, description, products
        case designerName = "designer_name"
        case designerImage = "designer_image"
        case collectionImages =  "collection_images"
        case collectionName = "collection_name"
    }
}
