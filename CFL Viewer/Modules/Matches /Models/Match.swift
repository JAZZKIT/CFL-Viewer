//
//  Match.swift
//  CFL Viewer
//
//  Created by Denny on 05.04.2022.
//

import Foundation

struct Match: Codable {
    let data: [MatchList]
}

struct MatchList: Codable {
    let dateStart: String?
    let season: Int?
    let eventType: EventInfo?
    let eventStatus: EventInfo?
    let venue: EventInfo?
    let team1: Team?
    let team2: Team?

    enum CodingKeys: String, CodingKey {
        case dateStart = "date_start"
        case season = "season"
        case eventType = "event_type"
        case eventStatus = "event_status"
        case venue = "venue"
        case team1 = "team_1"
        case team2 = "team_2"
    }
    
    static func makeSkeleton() -> MatchList {
        return MatchList(dateStart: "2", season: nil, eventType: nil, eventStatus: nil, venue: nil, team1: nil, team2: nil)
    }
}

struct Team: Codable {
    let nickname: String?
    let score: Int?
}

struct EventInfo: Codable {
    let name: String?
}

