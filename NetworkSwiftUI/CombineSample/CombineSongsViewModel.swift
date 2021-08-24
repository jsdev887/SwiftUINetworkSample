//
//  CombineSongsViewModel.swift
//  NetworkSwiftUI
//
//  Created by jwshin on 2021/08/23.
//

import Foundation
import Combine

class CombineSongsViewModel: ObservableObject {
    
    @Published var songs: [Song] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        loadSongs()
    }
}

extension CombineSongsViewModel {
    
    func loadSongs() {
        cancellationToken = CombineSongDB.request(.taylorSwiftSongs)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.songs = $0.results
            })
    }    
}
