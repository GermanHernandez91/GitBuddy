//
//  GetUsersUseCaseTests.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import Foundation

import XCTest
@testable import GitBuddy

final class GetUsersUseCaseTests: XCTestCase {
    
    private var sut: GetUsersUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = GetUsersUseCase(repository: UserRepositoryImpl(userService: MockApi()))
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_execute_shouldReturnCharacters() async throws {
        let users = try await sut.execute()
        XCTAssertEqual(users.isEmpty, false)
    }
}
