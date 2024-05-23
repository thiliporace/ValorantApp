//
//  FollowingModel.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import Foundation

class FollowingModel: NSObject{
    @Published var followingTeams: [FollowingSegment] = []
    @Published var names: [String] = []
    @Published var error: FollowingError?
    
    func getTeams(region: String, callback: (_ error: Error?) -> Void) async {
        guard let url = URL(string: "https://vlrggapi.vercel.app/rankings/\(region)") else { fatalError("Missing URL") }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
        
            let decodedUsers = try JSONDecoder().decode(Following.self, from: data)
            //print("decoded users: \(decodedUsers)")
            self.followingTeams = decodedUsers.data
            callback(nil)
            //print("Matches: ", self.matches)
        } catch let error {
            print("Error decoding: ", error)
            callback(error)
        }
    }
}


enum FollowingError: Error{
    case requestError //URL valida mas servidor offline
    case invalidURL
    case invalidResponse
    case invalidData
}
