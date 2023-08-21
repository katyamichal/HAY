//
//  FavouriteService.swift
//  HayBase
//
//  Created by Katya Michal on 02.08.2023.
//

import Foundation

final class FavouriteService {
    
    private let basketProductArchiver = ProductArchiver(productType: .basket)
    
    let productArchiver = ProductArchiver(productType: .favourite)
    
    
    // retrieve data from user defaults
    func loadFavouriteProducts() -> [LocaleProduct]? {
        
        guard let products = productArchiver.retrieve() else {
            return nil
        }
        return products
    }
    
    func saveBasketProduct(product: LocaleProduct) {
        basketProductArchiver.save(product)
       
    }

}


final class BasketService {
    
    let productArchiver = ProductArchiver(productType: .basket)
    
    func loadProductToBuy() -> [LocaleProduct]? {
        guard let products = productArchiver.retrieve() else { return nil }
        return products
    }
    
}
