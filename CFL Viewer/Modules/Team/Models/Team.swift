//
//  Team.swift
//  CFL Viewer
//
//  Created by Denny on 09.04.2022.
//

import Foundation

struct Teams: Codable {
    let data: [TeamList]
}

struct TeamList: Codable {
    let nickname: String?
    let images: Image?
    
    enum CodingKeys: String, CodingKey {
        case nickname = "nickname"
        case images
    }
}

struct Image: Codable {
    let gametrackerSmallImageUrl: String?

    enum CodingKeys: String, CodingKey {
        case gametrackerSmallImageUrl = "gametracker_small_image_url"
    }
}
