//
//  HayService.swift
//  HayBase
//
//  Created by Katya Michal on 24.07.2023.
//

import Foundation

/// needed for dependency injection realization

protocol HayServiceable {
    
    func getInspiration() async throws -> Inspiration
    
    func getDesigners() async throws -> DesignerResponse
    
    func getPopularProduct() async throws -> PopularProduct
    
   
    
}

struct HayService: API, HayServiceable {
    
    func getPopularProduct() async throws -> PopularProduct {
        return try await performRequest(endpoint: HayEndpoints.popular, responseModel: PopularProduct.self)
    }
    
    func getDesigners() async throws -> DesignerResponse{
        return try await performRequest(endpoint: HayEndpoints.designers, responseModel: DesignerResponse.self)
    }
    
    func getInspiration() async throws -> Inspiration {
        return try await performRequest(endpoint: HayEndpoints.inspiration, responseModel: Inspiration.self)
    }

}
