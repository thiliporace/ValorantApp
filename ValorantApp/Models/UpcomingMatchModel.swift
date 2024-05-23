//
//  MatchModel.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import Foundation
import UIKit

class UpcomingMatchModel: NSObject{
    var upcomingMatches: [UpcomingSegment] = []
    var names: [String] = []
    var error: MatchError?
    
    func getMatches(callback: (_ error: Error?) -> Void) async {
        guard let url = URL(string: "https://vlrggapi.vercel.app/match?q=upcoming") else { fatalError("Missing URL") }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
        
            let decodedUsers = try JSONDecoder().decode(UpcomingMatch.self, from: data)
            //print("decoded users: \(decodedUsers)")
            self.upcomingMatches = decodedUsers.data.segments
            callback(nil)
            //print("Matches: ", self.matches)
        } catch let error {
            print("Error decoding: ", error)
            callback(error)
        }
    }
}


enum MatchError: Error{
    case requestError //URL valida mas servidor offline
    case invalidURL
    case invalidResponse
    case invalidData
}
