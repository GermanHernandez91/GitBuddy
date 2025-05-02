//
//  UserDetailsViewModel.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

final class UserDetailsViewModel {
    
    private(set) var user: GitUser?
    private(set) var repositories: [GitRepository] = []
    private(set) var errorMessage = ""
    
    var isLoading = false
    var hasError = false
    
    @ObservationIgnored
    private let getUserDetailsUseCase: GetUserDetailsUseCase
    
    @ObservationIgnored
    private let getReposUseCase: GetReposUseCase
    
    init(
        username: String,
        getUserDetailsUseCase: GetUserDetailsUseCase = GetUserDetailsUseCase(),
        getReposUseCase: GetReposUseCase = GetReposUseCase()
    ) {
        self.getUserDetailsUseCase = getUserDetailsUseCase
        self.getReposUseCase = getReposUseCase
        
        Task {
            await fetchUser(username: username)
        }
    }
    
    func fetchUser(username: String) async {
        isLoading = true
        hasError = false
        errorMessage = ""
        
        do {
            user = try await getUserDetailsUseCase.execute(for: username)
            await fetchRepositories(username: username)
        } catch {
            isLoading = false
            hasError = true
            errorMessage = String(localized: "We could not found this user at this time. Please try again later.")
        }
    }
    
    func fetchRepositories(username: String) async {
        do {
            repositories = try await getReposUseCase.execute(for: username)
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            errorMessage = String(localized: "We could not fetch repositories for this user at this time. Please try again later.")
        }
    }
}
