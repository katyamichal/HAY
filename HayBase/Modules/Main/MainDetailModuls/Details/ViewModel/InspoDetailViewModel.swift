//
//  InspoDetailViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 27.07.2023.


import Foundation

// TODO: - Clean up a messy code


final class InspoDetailViewModel {
    
    private let productArchiver = ProductArchiver(productType: .favourite)
    private let basketProductArchiver = ProductArchiver(productType: .basket)
    private lazy var inspoProducts: [LocaleProduct] = inpirationFeed.products
    private var savedProducts: [LocaleProduct]?

    let inpirationFeed: LocaleInspirationFeed
    var inspoMergedProducts: [LocaleProduct]?
    var onUpdateViewModel: (()->())?
    
    
    
    // MARK: - Init
    
    init(inpirationFeed: LocaleInspirationFeed) {
        self.inpirationFeed = inpirationFeed
    }
    
    // MARK: - Public

    func update(product: LocaleProduct) {

        if product.isFavourite {
            productArchiver.save(product)
        } else {
            productArchiver.delete(product)
        }
        update()
    }
    
    func update() {
        defer {
            onUpdateViewModel?()
        }
        savedProducts = productArchiver.retrieve()
        mergeProducts()
    }
    // MARK: - Private

    private func mergeProducts() {
        guard let savedProducts else {
            inspoMergedProducts = inspoProducts
            return
        }
        var merged: [LocaleProduct] = inspoProducts
        
        for saved in savedProducts {
            if let index = merged.firstIndex(where: { $0.id == saved.id }) {
                merged[index].isFavourite = saved.isFavourite
            }
        }
        inspoMergedProducts = merged
    }
    
    func saveToBasket(product: LocaleProduct) {
        basketProductArchiver.save(product)
    }
}



