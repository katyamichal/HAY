//
//  File.swift
//  HayBase
//
//  Created by Catarina Polakowsky on 18.07.2023.
//

import Foundation

protocol API {
    func performRequest<HayT: Decodable>(endpoint: Endpoint, responseModel: HayT.Type) async -> Result<HayT, RequestProcessorError>
}

extension API {
    func performRequest<HayT: Decodable>(endpoint: Endpoint, responseModel: HayT.Type) async -> Result<HayT, RequestProcessorError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return .failure(RequestProcessorError.failToCreateURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        //request.allHTTPHeaderFields = endpoint.header
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                return .failure(RequestProcessorError.unexpectedResponse(response))
            }
            
            switch response.statusCode {
            case 200..<300:
                guard let decodedResponse = try? JSONDecoder().decode(HayT.self, from: data) else {
                    return .failure(.unableToDecode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.statusCode(response.statusCode))
            }
            
        } catch {
            return .failure(.unknown)
        }
    }
}


