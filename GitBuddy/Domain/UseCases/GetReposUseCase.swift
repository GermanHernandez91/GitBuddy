//
//  GetReposUseCase.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

final class GetReposUseCase {
    
    private let repository: GitRepoRepository
    
    init(repository: GitRepoRepository = GitRepoRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(for username: String) async throws -> [GitRepository] {
        try await repository.getRepositories(from: username).filter { !$0.fork }
    }
}
