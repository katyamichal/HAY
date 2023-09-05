//
//  HayEndpoins.swift
//  HayBase
//
//  Created by Katya Michal on 16.07.2023.
//
//

// 1.2 https://apingweb.com/api/rest/26b4c2208e962cc80d96694d9944947320/inspiration
//https://apingweb.com/api/rest/2a73dfd54faaba3a987a683668f22d8416/inspiration
//
//2.2 https://apingweb.com/api/rest/885cf0c6fc07da547594a5b1dcb0667d24/designers
//https://apingweb.com/api/rest/76b389625deda828edfc1657e8c6114d0/designers

// 3. 
//https://apingweb.com/api/rest/f43525aa631e06f5a8be9cc31c6ddace18/popular


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
            return "/api/rest/2a73dfd54faaba3a987a683668f22d8416/inspiration"
            
        case .designers:
            return "/api/rest/76b389625deda828edfc1657e8c6114d0/designers"
            
        case .popular:
            return "/api/rest/f43525aa631e06f5a8be9cc31c6ddace18/popular"
            
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
