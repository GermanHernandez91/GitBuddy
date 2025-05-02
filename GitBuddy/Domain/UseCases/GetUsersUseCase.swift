//
//  GetUsersUseCase.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

final class GetUsersUseCase {
    
    private let repository: UserRepository
    
    init(repository: UserRepository = UserRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [GitUser] {
        try await repository.getAllUsers()
    }
}
