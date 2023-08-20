//
//  LocaleDesigners.swift
//  HayBase
//
//  Created by Katya Michal on 11.08.2023.
//

import Foundation

struct LocaleDesigners: Codable {
    let designers: [LocaleDesigner]
}

struct LocaleDesigner: Codable {

    let id: Int
    let designerName: String
    let designerImage: String
    let collectionImages: [String]
    let collectionName: String
    let description: String
    let products: [LocaleProduct]
}
