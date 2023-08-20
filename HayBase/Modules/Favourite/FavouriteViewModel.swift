//
//  FavouriteViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import Foundation

final class FavouriteViewModel {
    
    // var onUpdateModel: (()->())?
    
    private let favouriteService: FavouriteService
    
    lazy var productArchiver = favouriteService.productArchiver
    
    var products: [LocaleProduct]?
    
    init(favouriteService: FavouriteService) {
        self.favouriteService = favouriteService
    }
    
    func loadProduct() {
        products = favouriteService.loadFavouriteProducts()?.reversed()
    }
    
    func update(product: LocaleProduct) {
        if product.isFavourite {
            productArchiver.save(product)
            ProductArchiver.favourite?.append(product)
        } else {
            productArchiver.delete(product)
            ProductArchiver.favourite?.removeAll(where: {$0.id == product.id})
        }
        loadProduct()
    }
    
}



