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
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    func getMatches(in year: String, completed: @escaping (Result<Match, CFError>) -> Void) {
        AF.request(baseURL+"/v1/games/\(year)?key=\(key)")
            .validate()
            .responseDecodable(of: Match.self) { (response) in
                
                guard let matches = response.value else {
                    completed(.failure(.invalidResponse))
                    return
                }
                
                completed(.success(matches))
            }
    }
    
    func getTeams(completed: @escaping (Result<Teams, CFError>) -> Void) {
        AF.request(baseURL+"/v1/teams?key=\(key)")
            .validate()
            .responseDecodable(of: Teams.self) { response in
                print(response)
                
                guard let teams = response.value else {
                    completed(.failure(.invalidResponse))
                    return
                }
                
                completed(.success(teams))
            }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        AF.request(url).validate().response { response in
            guard let data = response.data,
                  let image = UIImage(data: data) else {
                      completed(nil)
                      return
                  }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
    }
}
