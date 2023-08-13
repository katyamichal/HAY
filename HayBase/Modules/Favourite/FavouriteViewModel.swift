//
//  FavouriteViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import Foundation

final class FavouriteViewModel {
    
    private let favouriteService: FavouriteService
    
    private lazy var productArchiver = favouriteService.productArchiver
    
    var products: [LocalProduct]?
    
    init(favouriteService: FavouriteService) {
        self.favouriteService = favouriteService
    }
    
    func loadProduct() {
       
        products = favouriteService.loadFavouriteProducts()?.reversed()
        print(products)
    }
    
}



