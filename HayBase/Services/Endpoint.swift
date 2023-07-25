//
//  RequestEndpoints.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 24.07.2023.
//

import Foundation
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String:String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "apingweb.com"
    }
}


enum RequestMethod: String {
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}
