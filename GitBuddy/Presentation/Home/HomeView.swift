//
//  HomeView.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import SwiftUI
import LoadingViewKit

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        LoadingViewKit(title: String(localized: "Loading users..."), isLoading: $viewModel.isLoading) {
            NavigationStack {
                List {
                    ForEach(viewModel.users) { user in
                        NavigationLink {
                            UserDetailsView(viewModel: .init(username: user.login))
                        } label: {
                            UserCellView(user: user)
                        }
                    }
                }
                .navigationTitle("GitBuddy")
                .listRowSpacing(10.0)
                .alert(isPresented: $viewModel.hasError) {
                    Alert(title: Text("Something went wrong"), message: Text(viewModel.errorMessage))
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
