//
//  FavouriteViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 01.08.2023.
//

import Foundation

final class FavouriteViewModel {
    
    let favouriteService: FavouriteService
    
    var favProducts: [LocalProduct] = []
  

    init(favouriteService: FavouriteService) {
        self.favouriteService = favouriteService
    }
    
}
