//
//  FavouriteService.swift
//  HayBase
//
//  Created by Katya Michal on 02.08.2023.
//

import Foundation

final class FavouriteService {
 
    // retrieve data from user defaults
    func loadFavouriteProducts() -> [LocalProduct]? {
        guard let products = ProductArchiver.productArchiver.retrieve() else {
            return nil
        }
        return products
    }
}
