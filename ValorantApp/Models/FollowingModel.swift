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
    
    func getTeams(region: String) {
            guard let url = URL(string: "https://vlrggapi.vercel.app/rankings/\(region)") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: url)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse else { return }
                print("Resposta: ", response)
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                
                    DispatchQueue.main.async {
                        do {
                            let decodedUsers = try JSONDecoder().decode(Following.self, from: data)
                            //print("decoded users: \(decodedUsers)")
                            self.followingTeams = decodedUsers.data
                            //print("Matches: ", self.matches)
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }
            dataTask.resume()
        }
}


enum FollowingError: Error{
    case requestError //URL valida mas servidor offline
    case invalidURL
    case invalidResponse
    case invalidData
}
