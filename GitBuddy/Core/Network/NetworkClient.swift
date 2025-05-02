//
//  NetworkClient.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

enum NetworkClient {
    
    struct Request {
        let url: String
        let method: NetworkMethod
        let headers: [String: String]?
        let body: Encodable?
        let parameters: [String: String]?
        
        init(
            url: String,
            method: NetworkMethod,
            headers: [String: String]? = nil,
            body: Encodable? = nil,
            paremeters: [String: String]? = nil
        ) {
            self.url = url
            self.method = method
            self.headers = headers
            self.body = body
            self.parameters = paremeters
        }
        
        func run<T: Decodable>(
            urlSession: URLSession = .shared,
            encoder: JSONEncoder = .init(),
            decoder: JSONDecoder = .init()
        ) async throws -> T {
            guard let url = URL(string: url) else {
                throw NetworkError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.setValue(Constants.authToken, forHTTPHeaderField: "Authorization")
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headers
            
            if let parameters {
                let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
                request.url?.append(queryItems: queryItems)
            }
            
            if let body {
                let data = try encoder.encode(body)
                request.httpBody = data
            }
            
            let (data, response) = try await urlSession.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? decoder.decode(T.self, from: data) else {
                    throw NetworkError.decode
                }
                return decodedResponse
            case 401:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.unexpectedStatusCode(statusCode: response.statusCode)
            }
        }
        
        func run(
            urlSession: URLSession = .shared,
            encoder: JSONEncoder = .init(),
            decoder: JSONDecoder = .init()
        ) async throws {
            guard let url = URL(string: url) else {
                throw NetworkError.invalidURL
            }
            
            var request = URLRequest(url: url)
            request.setValue(Constants.authToken, forHTTPHeaderField: "Authorization")
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headers
            
            if let parameters {
                let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
                request.url?.append(queryItems: queryItems)
            }
            
            if let body {
                let data = try encoder.encode(body)
                request.httpBody = data
            }
            
            let (_, response) = try await urlSession.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }
            
            switch response.statusCode {
            case 200...299:
                break
            case 401:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.unexpectedStatusCode(statusCode: response.statusCode)
            }
        }
    }
}

