//
//  GetReposUseCaseTests.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import XCTest
@testable import GitBuddy

final class CharacterGetAllUseCaseTests: XCTestCase {
    
    private var sut: GetReposUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = GetReposUseCase(repository: GitRepoRepositoryImpl(gitRepoService: MockApi()))
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_execute_shouldReturnCharacters() async throws {
        let repositories = try await sut.execute(for: "default")
        XCTAssertEqual(repositories.isEmpty, false)
    }
}
