//
//  HayEndpoins.swift
//  HayBase
//
//  Created by Katya Michal on 16.07.2023.
//
//
//1. https://apingweb.com/api/rest/81ec7c49d78c2e9eafef2c5ebe47085627/inspiration
//1.1 https://apingweb.com/api/rest/057759bc7db4674e59b2fae9ac99f45015/inspo
//
//2. https://apingweb.com/api/rest/2d9f824a29df805842530a73726afe9321/designers
//2.1 https://apingweb.com/api/rest/565a31eb949c0deccbbf3a48e347484c2/designers

// 3. https://apingweb.com/api/rest/3150fa727c18fe065bfdf3d8a272dd3c6/popular


import Foundation



enum HayEndpoints {
    
    case inspiration
    
    case designers
    
    case popular
    
    case newProducts
}


extension HayEndpoints: Endpoint {

    var path: String {
        switch self {
        case .inspiration:
            return "/api/rest/057759bc7db4674e59b2fae9ac99f45015/inspo"
        case .designers:
            return "/api/rest/565a31eb949c0deccbbf3a48e347484c2/designers"
            
        case .popular:
            return "/api/rest/3150fa727c18fe065bfdf3d8a272dd3c6/popular"
        default: return ""
        }
    }
    var method: RequestMethod {
        switch self {
        case .inspiration, .designers, .newProducts, .popular:
            return RequestMethod.get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .inspiration, .designers, .newProducts, .popular:
            return nil
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .inspiration, .designers, .newProducts, .popular:
            return nil
        }
    }
}
