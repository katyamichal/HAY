//
//  CartViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 20.08.2023.
//

import Foundation

final class BasketViewModel {
    
    private let cartService: CartService
    
    init(cartService: CartService) {
        self.cartService = cartService
    }
    
 var products: [LocaleProduct]?
    
  lazy var orderInfo: [Int] = [subtotal, delivery, total]
    
  private var subtotal: Int {
        var price = 0
        products?.forEach({ product in
          price += product.price
        })
        return price
    }
    
    private var delivery: Int = 10
    
    private var total: Int {
        subtotal + delivery
    }
    
    func loadProduct() {
        products = cartService.loadProductToBuy()?.reversed()
    }
    
    
    
}
