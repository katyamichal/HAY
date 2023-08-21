//
//  BasketViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 20.08.2023.
//

import Foundation

final class BasketViewModel {
    
    private let cartService: CartService
    
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

    init(cartService: CartService) {
        self.cartService = cartService
    }
    
    // MARK: - Public
    var products: [LocaleProduct]?
    
    var orderInfo: [Int] {
        return [subtotal, delivery, total]
    }
    
    func loadProduct() {
        products = cartService.loadProductToBuy()?.reversed()
    }
}
