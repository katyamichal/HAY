//
//  BasketViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 20.08.2023.
//

import Foundation

final class BasketViewModel {
    
    private let basketService: BasketService
    
    private var subtotal: Int {
        var price = 0
        products?.forEach({ product in
            price += product.price })
        return price
    }
    
    private let delivery: Int = 10
    
    private var total: Int {
        subtotal + delivery
    }

    // MARK: - Init

    init(basketService: BasketService) {
        self.basketService = basketService
    }
    
    // MARK: - Public
    var products: [LocaleProduct]?
    
    var orderInfo: [Int] {
        return [subtotal, delivery, total]
    }
    
    func loadProduct() {
        products = basketService.loadProductToBuy()?.reversed()
    }
    
    func deleteProduct(product: LocaleProduct) {
        products?.removeAll(where: { $0.id == product.id })
        basketService.productArchiver.delete(product)
    }
}
