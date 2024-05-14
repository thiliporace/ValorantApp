//
//  MatchEntity.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import Foundation

struct UpcomingMatch: Codable {
    let data: UpcomingMatchStruct
}

struct UpcomingMatchStruct: Codable {
    let status: Int
    let segments: [UpcomingSegment]
    
}

struct UpcomingSegment: Codable, Hashable {
    let team1, team2, flag1, flag2: String
    let timeUntilMatch, matchSeries, matchEvent, unixTimestamp: String
    let matchPage: String
    
    enum CodingKeys: String, CodingKey {
        case team1, team2, flag1, flag2
        case timeUntilMatch = "time_until_match"
        case matchSeries = "match_series"
        case matchEvent = "match_event"
        case unixTimestamp = "unix_timestamp"
        case matchPage = "match_page"
    }
}
