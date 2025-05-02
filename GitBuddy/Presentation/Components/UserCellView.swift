//
//  UserCellView.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import SwiftUI

struct UserCellView: View {
    
    let user: GitUser
    
    var body: some View {
        HStack(spacing: 10.0) {
            UserAvatarView(avatarUrl: user.avatarUrl, size: .cell)
            
            Text(user.login)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    UserCellView(user: .init(id: 1, login: "german", avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4", name: "German", followers: 2, following: 34))
}
