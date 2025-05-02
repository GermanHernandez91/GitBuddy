//
//  UserAvatarView.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import SwiftUI

enum AvatarSize {
    case cell
    case details
}

struct UserAvatarView: View {
    
    let avatarUrl: String?
    let size: AvatarSize
    
    var body: some View {
        if let avatarUrl {
            AsyncImage(url: URL(string: avatarUrl)) { image in
                image
                    .resizable()
                    .frame(width: size == .cell ? 50 : 100, height: size == .cell ? 50 : 100)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .shadow(radius: 8)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    UserAvatarView(avatarUrl: "", size: .details)
}
