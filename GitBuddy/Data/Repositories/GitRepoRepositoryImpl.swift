//
//  GitRepoRepositoryImpl.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

final class GitRepoRepositoryImpl: GitRepoRepository {
    
    private let gitRepoService: ApiService
    
    init(gitRepoService: ApiService = GithubApiService()) {
        self.gitRepoService = gitRepoService
    }
    
    func getRepositories(from username: String) async throws -> [GitRepository] {
        try await gitRepoService.fetchRepositories(from: username)
    }
}
