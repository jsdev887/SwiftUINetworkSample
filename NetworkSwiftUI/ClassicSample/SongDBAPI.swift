//
//  SongDB.swift
//  NetworkSwiftUI
//
//  Created by jwshin on 2021/08/23.
//

import Foundation

enum SongDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")!
}

extension SongDB {
    
    static func request(_ path: APIPath, completion: @escaping (Any) -> ()) {
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        
        let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(SongResponse.self, from: data) {
                    
                    let result = decodedResponse.results
                    completion(result)
                }
            }
            
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()        
    }
}
