//
//  UserDetailsView.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import SwiftUI
import LoadingViewKit

struct UserDetailsView: View {
    
    @State var viewModel: UserDetailsViewModel
    
    var body: some View {
        LoadingViewKit(title: String(localized: "Loading user details"), isLoading: $viewModel.isLoading) {
            List {
                HStack(spacing: 20) {
                    UserAvatarView(avatarUrl: viewModel.user?.avatarUrl, size: .details)
                    
                    if let user = viewModel.user {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(user.login)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(user.name ?? "No name")
                                .font(.subheadline)
                        }
                    }
                    
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "person.3.fill")
                    Text("Followers")
                    Spacer()
                    Text("\(viewModel.user?.followers ?? 0)")
                }
                
                HStack {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Following")
                    Spacer()
                    Text("\(viewModel.user?.following ?? 0)")
                }
                
                Section("Repositories") {
                    ForEach(viewModel.repositories) { repository in
                        NavigationLink {
                            RepoDetailsView(htmlUrl: repository.htmlURL)
                        } label: {
                            RepoCellView(repository: repository)
                        }
                    }
                }
                .alert(isPresented: $viewModel.hasError) {
                    Alert(title: Text("Something went wrong"), message: Text(viewModel.errorMessage))
                }
            }
            .listRowSpacing(10)
        }
    }
}

#Preview {
    UserDetailsView(viewModel: .init(username: "mojombo"))
}
