//
//  InspoDetailViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 27.07.2023.
//

import Foundation

final class InspoDetailViewModel {
    
    // before propagate to properties check on the saved data
    // from saved data favourite view model gets the fav products
    
    var inpirationFeed: InspirationFeed
    
    private var products = [LocalProduct]()
    
    var inspoProducts: [LocalProduct]? {
        if products.isEmpty {
           products = createLocalProducts()
        }
        return products
    }
    
    func createLocalProducts() -> [LocalProduct] {
        
        let products = inpirationFeed.products
        
        let product = products.map {LocalProduct(id: $0.id, productName: $0.productName, description: $0.productName, price: $0.price, image: $0.image, isFavourite: false)
        }
        return product
    }
    
    
    init(inpirationFeed: InspirationFeed) {
        self.inpirationFeed = inpirationFeed
    }
    
    //    // func saveToFavService
    //    // // didSet ---> save data to disk ---> viewModel ---
    //    // plus update array with inspo product
    
    
    func updateProducts(with product: LocalProduct) {
//        var modifiedProduct = products.first { $0.id == product.id }
//
//        modifiedProduct?.isFavourite = product.isFavourite
        
        let index = products.firstIndex  { $0.id == product.id }
        products.insert(product, at: index!)
        
    }
}



// MARK: - Attempt to create generic view model has beed failed

//final class InspoDetailViewModel {
//
//    var model: Any
//
//    var inspiration: InspirationFeed?  {
//        guard let inspo = model as? InspirationFeed else {
//            return nil
//        }
//
//        return inspo
//    }
//
//    var inspoProducts: [LocalProduct] = []
//
//
//    var designer: DesignerResponse?  {
//        guard let designer = model as? DesignerResponse else {
//            return nil
//        }
//        return designer
//    }
//
//
//    init(model: Any) {
//        self.model = model
//    }
//
//
//    func createLocalProducts() {
//        guard let products = inspiration?.products else { return }
//        inspoProducts = products.map {LocalProduct(id: $0.id, productName: $0.productName, description: $0.productName, price: $0.price, image: $0.image, isFavourite: false)}
//    }
//    // func saveToFavService
//    // // didSet ---> save data to disk ---> viewModel ---
//    // plus update array with inspo product
//}
