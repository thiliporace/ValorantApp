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
    
    weak var viewController: UpcomingViewController?
    
    init(viewController: UpcomingViewController) {
       self.viewController = viewController
    }
    
    func getMatches() {
            guard let url = URL(string: "https://vlrggapi.vercel.app/match?q=upcoming") else { fatalError("Missing URL") }
            
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
                            let decodedUsers = try JSONDecoder().decode(UpcomingMatch.self, from: data)
                            //print("decoded users: \(decodedUsers)")
                            self.upcomingMatches = decodedUsers.data.segments
                            
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


enum MatchError: Error{
    case requestError //URL valida mas servidor offline
    case invalidURL
    case invalidResponse
    case invalidData
}
