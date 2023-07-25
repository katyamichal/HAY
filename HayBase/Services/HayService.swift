//
//  HayService.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 24.07.2023.
//

import Foundation

/// needed for dependency injection realization

protocol HayServiceable {
    func getInspiration() async -> Result<Inspiration, RequestProcessorError>
    
    func getDesigners() async -> Result<DesignerResponse, RequestProcessorError>
    
    func getPopularProduct() async -> Result<PopularProduct, RequestProcessorError>
    
}

struct HayService: API, HayServiceable {
    func getPopularProduct() async -> Result<PopularProduct, RequestProcessorError> {
        return await performRequest(endpoint: HayEndpoints.popular, responseModel: PopularProduct.self)
    }
    
    func getDesigners() async -> Result<DesignerResponse, RequestProcessorError> {
        return await performRequest(endpoint: HayEndpoints.designers, responseModel: DesignerResponse.self)
    }
    
    func getInspiration() async -> Result<Inspiration, RequestProcessorError> {
        return await performRequest(endpoint: HayEndpoints.inspiration, responseModel: Inspiration.self)
    }
    
    
}
