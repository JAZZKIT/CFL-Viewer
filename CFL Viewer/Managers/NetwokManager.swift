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
    
    func getMatches(in year: Int, completed: @escaping (Result<Match, Error>) -> Void ) {
        
        AF.request(baseURL+"/v1/games/2015?key=\(key)")
          .validate()
          .responseDecodable(of: Match.self) { (response) in
             let matches = response.value!
              print(matches.data[0].team1.nickname)
              completed(.success(matches))
              //print(matches.data.count)
//
//            self.films = films.all
//
//            self.items = films.all
//            self.tableView.reloadData()
          }
        
//        let request = AF.request(baseURL+"/v1/games/2015?key=\(key)")
//            // 2
//            request.responseJSON { (data) in
//              print(data)
//            }
    }
}
