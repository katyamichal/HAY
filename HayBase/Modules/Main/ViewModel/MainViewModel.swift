//
//  MainViewModel.swift
//  HayBase
//
//  Created by Katya Michal on 13.07.2023.
//

import UIKit
@MainActor

//TODO: - Separate View Models

final class MainViewModel {
    
    let service: HayServiceable
    
    let productArchiver: ProductArchiver = ProductArchiver(productType: .favourite)
    
    var savedProducts: [LocalProduct]? = []
    
    // MARK: - Popular View Model

   private var popularProduct: [Product] = []
    
    var popularLocaleProduct: [LocalProduct] {
        
        createLocalProducts(with: popularProduct)
    }
    
    
    // MARK: - Designer viewModel

  private var designers: [Designer] = []
    
    
    var localDesigners: [LocaleDesigner] {
        
        
        var localeDesigners: [LocaleDesigner] = []
        
        for designer in designers {
            let designerLocaleProducts = createLocalProducts(with: designer.products)
            
            let localeDesigner = LocaleDesigner(id: designer.id, designerName: designer.designerName, designerImage: designer.designerImage, collectionImages: designer.collectionImages, collectionName: designer.collectionName, description: designer.description, products: designerLocaleProducts)
            
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
    
    //Подписки - Property wrapper + closure
    var onDidUpdatedViewModel: (()->())?
    
    var isUpdated: Bool = false {
        didSet {
            if isUpdated {
                onDidUpdatedViewModel?()
                isUpdated = false
            }
        }
    }
    // MARK: - Init
    
    init(service: HayServiceable) {
        self.service = service
        savedProducts = productArchiver.retrieve()
    }
    
    func fetchModels()  {
        #warning("create a task group")
        
        Task {
            let result = await service.getInspiration()

            switch result {

            case .success(let inspiration):
                self.inspiration = inspiration.inspiration
                isUpdated = true
            case .failure(let error):
                print("***Error to fetch inspitation feed: \(error.localizedDescription)")
                
            }
        }
        
        Task {
     
            let result = await service.getDesigners()
            switch result {
            case .success(let designerResponse):
                self.designers = designerResponse.designers
                isUpdated = true
            case .failure(let error):
                print("***Error to fetch designer feed: \(error.localizedDescription)")
            }
        }
        
        Task {
       
            let result = await service.getPopularProduct()
            switch result {
            case .success(let popularProduct):
                self.popularProduct = popularProduct.products
                isUpdated = true
            case .failure(let error):
                print("***Error to fetch popular product: \(error.localizedDescription)")
            }
        }
    }
    
 private func createLocalProducts(with products: [Product]) -> [LocalProduct] {
     
     var products = products.map {LocalProduct(id: $0.id, productName: $0.productName, description: $0.description, price: $0.price, image: $0.image, isFavourite: false, isInCart: false, collectionImages: $0.imageCollection, material: $0.material, size: $0.size, colour: $0.colour)}
     
     guard let savedProducts else {
         return products
         
     }
     for saved in savedProducts {
         if let index = products.firstIndex(where: { $0.id == saved.id }) {
             products[index].isFavourite = saved.isFavourite
         }
     }
        return products
    }
}






