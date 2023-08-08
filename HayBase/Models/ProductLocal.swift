//
//  FavouriteModel.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import Foundation

struct LocalProduct: Codable, Equatable {
    
    var id: Int
    var productName: String
    var description: String
    var price: Int
    var image: String
    var isFavourite: Bool
    var isInCart: Bool
    var collectionImages: [String]
    var material: String
    var size: String
    var colour: String
  
    
    
    
    // MARK: - Equatable implementation

    static func ==(lhs: LocalProduct, rhs: LocalProduct) -> Bool {
        return lhs.id == rhs.id
    }
}
