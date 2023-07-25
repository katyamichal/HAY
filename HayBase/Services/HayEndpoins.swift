//
//  HayEndpoins.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 16.07.2023.
//
//
//1. https://apingweb.com/api/rest/81ec7c49d78c2e9eafef2c5ebe47085627/inspiration
//2.https://apingweb.com/api/rest/5265490f404a8445065bdca70e1ae1fc0/designers
//3. https://apingweb.com/api/rest/2d9f824a29df805842530a73726afe9321/designers


import Foundation



enum HayEndpoints {
    
    case inspiration
    
    case designers
    
    case popularProducts
    
    case newProducts
}


extension HayEndpoints: Endpoint {

    var path: String {
        switch self {
        case .inspiration:
            return "/api/rest/81ec7c49d78c2e9eafef2c5ebe47085627/inspiration"
        case .designers:
            return "/api/rest/2d9f824a29df805842530a73726afe9321/designers"
        default: return ""
        }
    }
    var method: RequestMethod {
        switch self {
        case .inspiration, .designers, .newProducts, .popularProducts:
            return RequestMethod.get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .inspiration, .designers, .newProducts, .popularProducts:
            return nil
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .inspiration, .designers, .newProducts, .popularProducts:
            return nil
        }
    }
}
