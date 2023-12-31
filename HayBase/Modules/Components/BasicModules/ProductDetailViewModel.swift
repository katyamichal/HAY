//
//  SeatingProductTableView.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.

import Foundation

final class ProductDetailViewModel {
    
    var product: LocaleProduct
    
    var images: [String] {
        product.collectionImages + [product.image]
    }
    
    var productInfo: [String] {
        [product.material, product.size, product.colour, "\(product.price)"]
    }
    
    // MARK: - Init
    
    init(product: LocaleProduct) {
        self.product = product
    }
}
