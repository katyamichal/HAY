//
//  FavouriteService.swift
//  HayBase
//
//  Created by Katya Michal on 02.08.2023.
//

import Foundation

final class FavouriteService {
    
    let productArchiver = ProductArchiver(productType: .favourite)
    
    // retrieve data from user defaults
    func loadFavouriteProducts() -> [LocalProduct]? {
        
        guard let products = productArchiver.retrieve() else {
            return nil
        }
        return products
    }
}
