//
//  FollowingMatchEntity.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import Foundation

// MARK: - Following
struct Following: Codable {
    let status: Int
    let data: [FollowingSegment]
}

// MARK: - FollowingStruct
struct FollowingSegment: Codable {
    let rank, team: String
    let country: Country
    let lastPlayed, lastPlayedTeam, lastPlayedTeamLogo, record: String
    let earnings, logo: String

    enum CodingKeys: String, CodingKey {
        case rank, team, country
        case lastPlayed = "last_played"
        case lastPlayedTeam = "last_played_team"
        case lastPlayedTeamLogo = "last_played_team_logo"
        case record, earnings, logo
    }
}

enum Country: String, Codable {
    case canada = "Canada"
    case international = "International"
    case unitedStates = "United States"
}
