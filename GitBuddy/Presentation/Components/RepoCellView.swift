//
//  RepoCellView.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 2/5/25.
//

import SwiftUI

struct RepoCellView: View {
    
    let repository: GitRepository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 3) {
                Text(repository.name)
                    .font(.headline)
                
                HStack(spacing: 3) {
                    Image(systemName: "star.fill")
                    Text("\(repository.stargazersCount ?? 0)")
                }
                .font(.subheadline)
            }
            
            
            Text("Language: \(repository.language ?? "Unknown")")
            
            if let description = repository.description {
                Divider()
                Text(description)
            }
        }
    }
}

#Preview {
    RepoCellView(repository: .init(id: 1, name: "Repository", language: "en", stargazersCount: 34, description: nil, htmlURL: nil, fork: false))
}
