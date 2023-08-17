//
//  FavouriteViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import Foundation

final class FavouriteViewModel {
    
    var onUpdateModel: (()->())?
    
    private let favouriteService: FavouriteService
    
    private lazy var productArchiver = favouriteService.productArchiver
    
    var products: [LocalProduct]?
    
    init(favouriteService: FavouriteService) {
        self.favouriteService = favouriteService
    }
    
    func loadProduct() {
        products = favouriteService.loadFavouriteProducts()?.reversed()
        onUpdateModel?()
    }
    
    func update(product: LocalProduct) {
        if product.isFavourite {
            productArchiver.save(product)
        } else {
            productArchiver.delete(product)
        }
        loadProduct()
    }
    
}



