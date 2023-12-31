//
//  RequestProcessorError.swift
//  HayBase
//
//  Created by Katya Michal on 24.07.2023.
//

import Foundation

enum RequestProcessorError: Error {
    case wrongUrl(URLComponents)
    case failToCreateURL
    case unexpectedResponse(URLResponse)
    case statusCode(Int)
    case unableToDecode
    case unknown
    case unauthorized
}
