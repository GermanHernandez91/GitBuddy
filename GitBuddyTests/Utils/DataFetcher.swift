//
//  DataFetcher.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import Foundation

final class DataFetcher {
    static let shared = DataFetcher()
    
    private init() {}
    
    enum DataFetcherError: Error {
        case invalidFile
        case somethingWentWrong
    }
    
    func getJsonData<T: Codable>(from fileName: String) async throws -> T {
        let testBundle = Bundle(for: type(of: self))
        
        guard let url = testBundle.url(forResource: fileName, withExtension: "json") else {
            throw DataFetcherError.invalidFile
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            throw DataFetcherError.somethingWentWrong
        }
    }
}
