//
//  GetUserDetailsUseCase.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

final class GetUserDetailsUseCase {
    
    private let repository: UserRepository
    
    init(repository: UserRepository =  UserRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(for username: String) async throws -> GitUser? {
        try await repository.getUser(login: username)
    }
}
