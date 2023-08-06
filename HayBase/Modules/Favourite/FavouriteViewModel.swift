//
//  FavouriteViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import Foundation

final class FavouriteViewModel {
    
    let favouriteService: FavouriteService
    
    var products: [LocalProduct]?
  

    init(favouriteService: FavouriteService) {
        self.favouriteService = favouriteService
    }
    
    func loadProduct() {
        products = favouriteService.loadFavouriteProducts()?.reversed()
    }
    
    func update(with product: LocalProduct) {
        guard let index = products?.firstIndex (where: { $0.id == product.id }) else {
            return
        }
        
        if product.isFavourite {
            saveFavourite(products: [product])
        } else {
            deleteFavourite(product: product)
        }
        
    }
    private func saveFavourite(products: [LocalProduct]) {
        ProductArchiver.productArchiver.save(products)
    }
    
    private func deleteFavourite(product: LocalProduct) {
        ProductArchiver.productArchiver.delete(product)
    }
    
}
