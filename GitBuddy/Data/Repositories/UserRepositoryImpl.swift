//
//  UserRepositoryImpl.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

final class UserRepositoryImpl: UserRepository {
    
    private let userService: ApiService
    
    init(userService: ApiService = GithubApiService()) {
        self.userService = userService
    }
    
    func getAllUsers() async throws -> [GitUser] {
        try await userService.fetchUsers()
    }
    
    func getUser(login: String) async throws -> GitUser? {
        try await userService.fetchUsers(from: login)
    }
}
