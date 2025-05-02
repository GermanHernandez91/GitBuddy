//
//  UserDetailsViewModelTests.swift
//  GitBuddyTests
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import XCTest
@testable import GitBuddy

final class UserDetailsViewModelTests: XCTestCase {
    
    private var sut: UserDetailsViewModel!
        
    override func setUp() async throws {
        try await super.setUp()
        
        sut = UserDetailsViewModel(
            username: "default",
            getUserDetailsUseCase: GetUserDetailsUseCase(repository: UserRepositoryImpl(userService: MockApi())),
            getReposUseCase: GetReposUseCase(repository: GitRepoRepositoryImpl(gitRepoService: MockApi()))
        )
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func testShouldFetchUserDetails() async throws {
        await sut.fetchUser(username: "default")
        
        XCTAssertNotNil(sut.user)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.hasError)
    }
    
    func testShouldFetchReposNotForked() async throws {
        await sut.fetchRepositories(username: "default")
        
        XCTAssertFalse(sut.repositories.isEmpty)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.hasError)
        XCTAssertTrue(sut.repositories.first?.fork == false)
    }
}
