//
//  GitRepository.swift
//  GitBuddy
//
//  Created by Germán Hernández del Rosario on 1/5/25.
//

import Foundation

struct GitRepository: Codable, Identifiable {
    let id: Int
    let name: String
    let language: String?
    let stargazersCount: Int?
    let description: String?
    let htmlURL: String?
    let fork: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case language
        case stargazersCount = "stargazers_count"
        case description
        case htmlURL = "html_url"
        case fork
    }
}
