//
//  MainViewModel.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 13.07.2023.
//

import UIKit
@MainActor
final class MainViewModel {
    
    var service: HayServiceable
    
    var popularProduct: [Product] = []
    var designers: [Designer] = []
    var inspiration: [InspirationFeed] = []
//    {
//        didSet {
//            onInspirationFeed?()
//        }
//    }
    
    
    //Подписки - Property wrapper + closure
    var onDidUpdatedViewModel: (()->())?
    
    var isUpdated: Bool = false {
        didSet {
            if isUpdated == true {
                onDidUpdatedViewModel?()
            }
        }
    }
    // MARK: - Init
    
    init(service: HayServiceable) {
        self.service = service
    }
    
    func fetchModels()  {
        #warning("create a task group")
        
        Task {
            isUpdated = false
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
                print("***Error to fetch inspitation feed: \(error.localizedDescription)")
            }
        }
        
        Task {
            let result = await service.getPopularProduct()
            switch result {
            case .success(let popularProduct):
                self.popularProduct = popularProduct.products
                isUpdated = true
            case .failure(let error):
                print("***Error to fetch inspitation feed: \(error.localizedDescription)")
            }
        }
    }
}



//Подписки - Property wrapper + closure

//    var onInspirationFeed: (([InspirationFeed])->())?
