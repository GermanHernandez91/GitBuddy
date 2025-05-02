//
//  HomeViewModelTests.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import XCTest
@testable import GitBuddy

final class HomeViewModelTests: XCTestCase {
    
    private var sut: HomeViewModel!
        
    override func setUp() async throws {
        try await super.setUp()
        
        sut = HomeViewModel(
            getUsersUseCase: GetUsersUseCase(repository: UserRepositoryImpl(userService: MockApi()))
        )
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func testInitShouldLoadUsers() async throws {
        await sut.fetchUsers()
        
        XCTAssertFalse(sut.users.isEmpty)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.hasError)
    }
}
