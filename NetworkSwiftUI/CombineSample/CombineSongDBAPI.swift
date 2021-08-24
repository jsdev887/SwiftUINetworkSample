//
//  CombineSongDB.swift
//  NetworkSwiftUI
//
//  Created by jwshin on 2021/08/23.
//

import Foundation
import Combine

enum CombineSongDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")!
}

enum APIPath: String {
    case taylorSwiftSongs = "taylor+swift&entity=song"
}

extension CombineSongDB {
    
    static func request(_ path: APIPath) -> AnyPublisher<SongResponse, Error> {

        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }    
}
