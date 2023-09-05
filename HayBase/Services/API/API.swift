//
//  File.swift
//  HayBase
//
//  Created by Katya Michal on 18.07.2023.
//

import Foundation

protocol API {
    func performRequest<HayT: Decodable>(endpoint: Endpoint, responseModel: HayT.Type) async  throws -> HayT
}

extension API {
    func performRequest<HayT: Decodable>(endpoint: Endpoint, responseModel: HayT.Type) async  throws -> HayT {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            throw RequestProcessorError.failToCreateURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw RequestProcessorError.unexpectedResponse(response)
            }
            
            switch response.statusCode {
            case 200..<300:
                guard let decodedResponse = try? JSONDecoder().decode(HayT.self, from: data) else {
                    throw RequestProcessorError.unableToDecode
                }
                return decodedResponse
            case 401:
                throw RequestProcessorError.unauthorized
            default:
                throw RequestProcessorError.statusCode(response.statusCode)
            }
            
        } catch {
            throw RequestProcessorError.unknown
        }
    }
}


