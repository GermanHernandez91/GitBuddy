//
//  UserRepository.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

protocol UserRepository {
    func getAllUsers() async throws -> [GitUser]
    func getUser(login: String) async throws -> GitUser?
}
