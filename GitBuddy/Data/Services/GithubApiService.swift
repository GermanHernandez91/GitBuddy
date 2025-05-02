//
//  GitUsersService.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

protocol ApiService {
    func fetchUsers() async throws -> [GitUser]
    func fetchUsers(from username: String) async throws -> GitUser
    func fetchRepositories(from username: String) async throws -> [GitRepository]
}

final class GithubApiService: ApiService {
    
    func fetchUsers() async throws -> [GitUser] {
        try await NetworkClient.Request(
            url: Constants.baseURL,
            method: .get,
            headers: ["Authorization": "Bearer \(Constants.authToken)"]
        ).run()
    }
    
    func fetchUsers(from username: String) async throws -> GitUser {
        let userUrl = Constants.baseURL + "/\(username)"
        return try await NetworkClient.Request(
            url: userUrl,
            method: .get,
            headers: ["Authorization": "Bearer \(Constants.authToken)"]
        ).run()
    }
    
    func fetchRepositories(from username: String) async throws -> [GitRepository] {
        let repoUrl = Constants.baseURL + "/\(username)/repos"
        return try await NetworkClient.Request(
            url: repoUrl,
            method: .get,
            headers: ["Authorization": "Bearer \(Constants.authToken)"]
        ).run()
    }
}
