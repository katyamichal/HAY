//
//  Product.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 05.07.2023.
//

import Foundation

struct Product: Codable {
    var id: Int
    var productName: String
    var description: String
    var price: Int
    var image: String
   // var type: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, description, price, image
        case productName = "product_name"
    }
}
