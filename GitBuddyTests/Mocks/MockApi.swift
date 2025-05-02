//
//  MockApi.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import Foundation
@testable import GitBuddy

final class MockApi: ApiService {
    
    func fetchUsers() async throws -> [GitUser] {
        try await DataFetcher.shared.getJsonData(from: "users")
    }
    
    func fetchUsers(from username: String) async throws -> GitBuddy.GitUser {
        try await DataFetcher.shared.getJsonData(from: "user_details")
    }
    
    func fetchRepositories(from username: String) async throws -> [GitRepository] {
        try await DataFetcher.shared.getJsonData(from: "repositories")
    }
}
