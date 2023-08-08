//
//  Product.swift
//  HayBase
//
//  Created by Katya Michal on 05.07.2023.
//

import Foundation

struct Product: Codable {
    
    var id: Int
    var productName: String
    var description: String
    var price: Int
    var image: String
    var imageCollection: [String]
    var material: String
    var size: String
    var colour: String
   

    
    enum CodingKeys: String, CodingKey {
        case id, description, price, image, material, size, colour
        case productName = "product_name"
        case imageCollection = "image_collection"
       
    }
}
