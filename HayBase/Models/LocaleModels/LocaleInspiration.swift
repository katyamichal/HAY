//
//  LocaleInspiration.swift
//  HayBase
//
//  Created by Katya Michal on 11.08.2023.
//

import Foundation

struct LocaleInspiration: Codable {
    
    var inspiration: [LocaleInspirationFeed]
}

struct LocaleInspirationFeed: Codable {
    let id: Int
    let collectionName: String
    let coverImage: String
    let description: String
    let images: [String]
    let products: [LocalProduct]
}

