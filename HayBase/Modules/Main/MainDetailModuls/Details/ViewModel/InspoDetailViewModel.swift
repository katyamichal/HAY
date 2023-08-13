//
//  InspoDetailViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 27.07.2023.


import Foundation

// TODO: - Clean up a messy code


final class InspoDetailViewModel {
    
    // MARK: - Public

    
    let productArchiver = ProductArchiver(productType: .favourite)
    
    let inpirationFeed: LocaleInspirationFeed
    
    var inspoProducts: [LocalProduct]? {
        set {
            self.products = []
        }
        get {
            mergeProducts()
        }
    }
    
    func update() {
        favProduct.removeAll()
        retrieveData()
    }
    
    // MARK: - Private

    private lazy var products: [LocalProduct] = inpirationFeed.products
    
    private var favProduct = [LocalProduct]()
    
    private func mergeProducts() -> [LocalProduct]? {
        
        guard !favProduct.isEmpty else { return products }
        
        for product in favProduct {
            if let index = products.firstIndex(where: { $0.id == product.id }) {
                products[index].isFavourite = product.isFavourite
            }
        }
        return products
    }
    
    
    private func retrieveData() {
        guard let products = productArchiver.retrieve() else { return }
        favProduct = products
    }
    
    // MARK: - Init
    
    init(inpirationFeed: LocaleInspirationFeed) {
        self.inpirationFeed = inpirationFeed
        retrieveData()
    }

}



