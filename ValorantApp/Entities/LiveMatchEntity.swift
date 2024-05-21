import Foundation

struct LiveMatch: Codable {
    let data: LiveMatchStruct
}

struct LiveMatchStruct: Codable {
    let status: Int
    let segments: [LiveSegment]
}

struct LiveSegment: Codable {
    let team1, team2, flag1, flag2: String
    let score1, score2, team1RoundCT, team1RoundT: String
    let team2RoundCT, team2RoundT, mapNumber, currentMap: String
    let timeUntilMatch, matchEvent, matchSeries, unixTimestamp: String
    let matchPage: String

    enum CodingKeys: String, CodingKey {
        case team1, team2, flag1, flag2, score1, score2
        case team1RoundCT = "team1_round_ct"
        case team1RoundT = "team1_round_t"
        case team2RoundCT = "team2_round_ct"
        case team2RoundT = "team2_round_t"
        case mapNumber = "map_number"
        case currentMap = "current_map"
        case timeUntilMatch = "time_until_match"
        case matchEvent = "match_event"
        case matchSeries = "match_series"
        case unixTimestamp = "unix_timestamp"
        case matchPage = "match_page"
    }
}
