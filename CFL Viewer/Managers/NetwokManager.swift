//
//  NetwokManager.swift
//  CFL Viewer
//
//  Created by Denny on 05.04.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.cfl.ca"
    private let key = "bUWOXaSzGjNP7rBwnIygKS29y24qlEu0"
    
    private init() { }
    
    func getMatches(in year: Int, completed: @escaping (Result<Match, CFError>) -> Void ) {
        AF.request(baseURL+"/v1/games/2015?key=\(key)")
            .validate()
            .responseDecodable(of: Match.self) { (response) in
                
                guard let matches = response.value else {
                    completed(.failure(.invalidResponse))
                    return
                }
                
                print(matches.data[0].team1?.nickname)
                completed(.success(matches))
                //print(matches.data.count)
            }
    }
}
