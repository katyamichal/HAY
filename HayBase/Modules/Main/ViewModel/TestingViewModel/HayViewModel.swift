//
//  HayViewModel.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 15.08.2023.
//
//
//import Foundation
//@MainActor
//final class HayViewModel {
//
//    let service: HayServiceable
//
//    enum SectionType {
//        case inspiration(viewModel: InspirationViewModel)
//        case popular(viewModel: PopularViewModel)
//        case designer(viewModel: DesignerViewModel)
//    }
//
//    public var sections: [SectionType] = []
//
//    init(service: HayServiceable) {
//        self.service = service
//    }
//
//    func fetchModels()  {
//        #warning("create a task group")
//
//        Task {
//            let result = await service.getInspiration()
//
//            switch result {
//
//            case .success(let inspiration):
//                sections.append(.inspiration(viewModel: ))
//               // isUpdated = true
//            case .failure(let error):
//                print("***Error to fetch inspitation feed: \(error.localizedDescription)")
//
//            }
//        }
//
//        Task {
//
//            let result = await service.getDesigners()
//            switch result {
//            case .success(let designerResponse):
//                sections.append(.designer(viewModel: ))
//              //  isUpdated = true
//            case .failure(let error):
//                print("***Error to fetch designer feed: \(error.localizedDescription)")
//            }
//        }
//
//        Task {
//
//            let result = await service.getPopularProduct()
//            switch result {
//            case .success(let popularProduct):
//                self.popularProduct = popularProduct.products
//              //  isUpdated = true
//            case .failure(let error):
//                print("***Error to fetch popular product: \(error.localizedDescription)")
//            }
//        }
//    }
//
//}
