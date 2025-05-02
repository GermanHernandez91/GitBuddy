//
//  GetUserDetailsUseCaseTests.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import Foundation

import XCTest
@testable import GitBuddy

final class GetUserDetailsUseCaseTests: XCTestCase {
    
    private var sut: GetUserDetailsUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = GetUserDetailsUseCase(repository: UserRepositoryImpl(userService: MockApi()))
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_execute_shouldReturnCharacters() async throws {
        let user = try await sut.execute(for: "default")
        XCTAssertNotNil(user)
    }
}
