//
//  SeatingProductTableView.swift
//  HayBase
//
//  Created by Katya Michal on 06.07.2023.

import Foundation

final class ProductDetailViewModel {
    
    var product: LocalProduct
    
    var images: [String] {
        [product.image] + ["label"] + product.collectionImages
    }
    
    var productInfo: [String] {
        [product.material, product.size, product.colour, "\(product.price)"]
    }
    
    // MARK: - Init
    
    init(product: LocalProduct) {
        self.product = product
    }
    
}
