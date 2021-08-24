//
//  SongResponse.swift
//  SongResponse.swift
//
//  Created by jwshin on 2021/08/23.
//

import Foundation

struct SongResponse: Codable {
    var results: [Song]
}

struct Song: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
