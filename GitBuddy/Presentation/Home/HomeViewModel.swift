//
//  HomeViewModel.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

@Observable
final class HomeViewModel {
    
    private(set) var users: [GitUser] = []
    private(set) var errorMessage = ""
    
    var isLoading = false
    var hasError = false
    
    @ObservationIgnored
    private let getUsersUseCase: GetUsersUseCase
    
    init(getUsersUseCase: GetUsersUseCase = GetUsersUseCase()) {
        self.getUsersUseCase = getUsersUseCase
        
        Task {
            await fetchUsers()
        }
    }
    
    func fetchUsers() async {
        isLoading = true
        hasError = false
        errorMessage = ""
        
        do {
            users = try await getUsersUseCase.execute()
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            errorMessage = String(localized: "We could not fetch the users at this time. Please try again later.")
        }
    }
}
