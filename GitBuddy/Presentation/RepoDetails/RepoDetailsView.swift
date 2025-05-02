//
//  RepoDetailsView.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import SwiftUI

struct RepoDetailsView: View {
    
    let htmlUrl: String?
    
    var body: some View {
        VStack {
            if let url = URL(string: htmlUrl ?? "") {
                WebView(url)
            } else {
                ContentUnavailableView("Content Unavailable", systemImage: "magnifyingglass", description: Text("We couldn't load the content for this repository. Please try again later."))
            }
        }
        .navigationTitle("Repository")
    }
}

#Preview {
    RepoDetailsView(htmlUrl: "")
}
