//
//  SongsView.swift
//  NetworkSwiftUI
//
//  Created by jwshin on 2021/08/24.
//

import SwiftUI

struct SongsView: View {
    
    @ObservedObject var viewModel = SongViewModel()
    
    var body: some View {
        
       List(viewModel.songs, id: \.trackId) { track in
        
            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(.headline)
                Text(track.collectionName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }.onAppear(perform: viewModel.loadSongs)
    }
}

struct SongsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SongsView()
    }
}
