//
//  GitRepoRepository.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

protocol GitRepoRepository {
    func getRepositories(from username: String) async throws -> [GitRepository]
}
