//
//  InspoDetailViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 27.07.2023.
//

//    // func saveToFavService
//    // // didSet ---> save data to disk ---> viewModel ---

//    // plus update array with inspo product +


// before propagate to properties check on the saved data
// from saved data favourite view model gets the fav products

import Foundation

// TODO: - Clean up a messy code


final class InspoDetailViewModel {
    
    let inpirationFeed: InspirationFeed
    
    private var products = [LocalProduct]()
    
    private var favProduct = [LocalProduct]()
    
    // product' mix from service data and saved data
    var inspoProducts: [LocalProduct]? {
        if products.isEmpty {
            products = createLocalProducts()
        }
        return products
    }
    
    private func createLocalProducts() -> [LocalProduct] {
        
        let serviceProduct = inpirationFeed.products
        
        var localProduct = serviceProduct.map { LocalProduct(id: $0.id, productName: $0.productName, description: $0.productName, price: $0.price, image: $0.image, isFavourite: false)
        }

        
        guard !favProduct.isEmpty else { return localProduct }
        
        for product in favProduct {
            if let index = localProduct.firstIndex(where: { $0.id == product.id }) {
                localProduct[index].isFavourite = product.isFavourite
            }
        }
        return localProduct
    }
    
    // MARK: - Init
    
    
    init(inpirationFeed: InspirationFeed) {
        self.inpirationFeed = inpirationFeed
        retrieveData()
    }
    
    func retrieveData() {
        guard let products = ProductArchiver.productArchiver.retrieve() else { return }
        favProduct = products
        
    }
    
    // MARK: - Methods to update the model
    
    func updateProducts(with product: LocalProduct) {
 
        let index = products.firstIndex  { $0.id == product.id }
  
        products[index!].isFavourite = product.isFavourite
       
        
        if product.isFavourite {
            favProduct.append(product)
            saveFavourite(products: favProduct)
        } else {
            favProduct.removeAll(where: { $0.id == product.id })
            deleteFavourite(product: product)
        }
    }
    // MARK: - methods to save favourite products

    private func saveFavourite(products: [LocalProduct]) {
        ProductArchiver.productArchiver.save(products)
    }
    
    private func deleteFavourite(product: LocalProduct) {
        ProductArchiver.productArchiver.delete(product)
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
