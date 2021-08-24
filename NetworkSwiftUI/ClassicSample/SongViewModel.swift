//
//  SongViewModel.swift
//  NetworkSwiftUI
//
//  Created by jwshin on 2021/08/24.
//

import Foundation

class SongViewModel: ObservableObject {
    
    @Published var songs: [Song] = [] 
    
    init() {
        loadSongs()
    }
}

extension SongViewModel {
    
    func loadSongs() {
        SongDB.request(.taylorSwiftSongs, completion: { response in
            
            guard let result = response as? [Song] else { return }
            
            DispatchQueue.main.async {
                self.songs = result
            }
        })
    }
    
}
