//
//  Match.swift
//  CFL Viewer
//
//  Created by Denny on 05.04.2022.
//

import Foundation

// MARK: - Matche
struct Match: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let dateStart: Date
    let season: Int
    let eventType, venue: EventType
    let team1, team2: Team

    enum CodingKeys: String, CodingKey {
        case dateStart = "date_start"
        case season
        case eventType = "event_type"
        case venue
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

// MARK: - EventType
struct EventType: Codable {
    let name: String
}

// MARK: - Team
struct Team: Codable {
    let nickname: String
    let score: Int
}
