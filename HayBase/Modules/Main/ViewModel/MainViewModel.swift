//
//  MainViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 13.07.2023.
//

import Foundation


//TODO: - to write an alert in case of bad network or some error

final class MainViewModel {
    
    private let service: HayServiceable
    
    private let productArchiver: ProductArchiver = ProductArchiver(productType: .favourite)
    
    private let basketProductArchiver: ProductArchiver = ProductArchiver(productType: .basket)
    
    private var savedProducts: [LocaleProduct]? = []
    private var basketProducts: [LocaleProduct]? = []
    
    
    // MARK: - Popular View Model
    
    private var popularProduct: [Product] = []
    
    var popularLocaleProduct: [LocaleProduct] {
        
        let localProduct: [LocaleProduct] = createLocalProducts(with: popularProduct)
        
        return mergeProducts(localProducts: localProduct)
    }
    
    
    // MARK: - Designer View Model
    
    private var designers: [Designer] = []
    
    var localDesigners: [LocaleDesigner] {
        
        var localeDesigners: [LocaleDesigner] = []
        
        for designer in designers {
            
            let designerLocaleProducts = createLocalProducts(with: designer.products)
            let mergeProducts = mergeProducts(localProducts: designerLocaleProducts)
            
            let localeDesigner = LocaleDesigner(id: designer.id, designerName: designer.designerName, designerImage: designer.designerImage, collectionImages: designer.collectionImages, collectionName: designer.collectionName, description: designer.description, products: mergeProducts)
            
            localeDesigners.append(localeDesigner)
        }
        return localeDesigners
    }
    
    
    
    
    // MARK: - Inspiration View Model
    
    private var inspiration: [InspirationFeed] = []
    
    var localInspiration: [LocaleInspirationFeed] {
        
        var localeInspiration: [LocaleInspirationFeed] = []
        
        for inspo in inspiration {
            
            let localeInspirationProducts = createLocalProducts(with: inspo.products)
            
            let localeInspo = LocaleInspirationFeed(id: inspo.id, collectionName: inspo.collectionName, coverImage: inspo.coverImage, description: inspo.description, images: inspo.images, products: localeInspirationProducts)
            
            localeInspiration.append(localeInspo)
        }
        return localeInspiration
    }
    
    // MARK: - Property Observer
    
    // Подписки - Property wrapper + closure
    var onUpdatedModel: (()->())?
    
    var isUpdated: Bool = false {
        didSet {
            if isUpdated {
                onUpdatedModel?()
                isUpdated = false
            }
        }
    }
    
    
    // MARK: - Update Module Methods
    
    func update(product: LocaleProduct) {
        defer {
            isUpdated = true
        }
        if product.isFavourite {
            productArchiver.save(product)
            ProductArchiver.favourite?.append(product)
        } else {
            productArchiver.delete(product)
            ProductArchiver.favourite?.removeAll(where: {$0.id == product.id})
        }
        savedProducts = productArchiver.retrieve()
    }
    
    
    func update() {
        defer {
            isUpdated = true
        }
        savedProducts = productArchiver.retrieve()
    }
    
    // MARK: - Init
    
    init(service: HayServiceable) {
        self.service = service
        savedProducts = productArchiver.retrieve()
        basketProducts = basketProductArchiver.retrieve()
        
    }
    
    // MARK: - Fetching Data
    
    func fetchModels() {
        
        Task {
            do {
                async let inspirationResult = try service.getInspiration()
                async let desingnersResult = try service.getDesigners()
                async let popularResult = try service.getPopularProduct()
                
                self.inspiration = try await inspirationResult.inspiration
                self.designers = try await desingnersResult.designers
                self.popularProduct = try await popularResult.products
                
                isUpdated = true
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    // MARK: - Create Products
    
    private func createLocalProducts(with products: [Product]) -> [LocaleProduct] {
        
        let products = products.map {LocaleProduct(id: $0.id, productName: $0.productName, description: $0.description, price: $0.price, image: $0.image, isFavourite: false, isInCart: false, collectionImages: $0.imageCollection, material: $0.material, size: $0.size, colour: $0.colour)}
        
        return products
    }
    
    private func mergeProducts(localProducts: [LocaleProduct]) -> [LocaleProduct] {
        guard let savedProducts else {
            return localProducts
        }
        var merged: [LocaleProduct] = localProducts
        
        for saved in savedProducts {
            if let index = merged.firstIndex(where: { $0.id == saved.id }) {
                merged[index].isFavourite = saved.isFavourite
            }
        }
        
        guard let basketProducts else { return merged }
        
        for product in basketProducts {
            if let index = merged.firstIndex(where: { $0.id == product.id }) {
                merged[index].isInCart = product.isInCart
            }
        }
        return merged
    }
}






