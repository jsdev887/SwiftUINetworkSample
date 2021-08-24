//
//  CombineSongsView.swift
//  NetworkSwiftUI
//
//  Created by jwshin on 2021/08/23.
//

import SwiftUI

struct CombineSongsView: View {
    
    @ObservedObject var viewModel = CombineSongsViewModel()
    
    var body: some View {
        
        List(viewModel.songs, id: \.trackId) { track in
            
            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(.headline)
                Text(track.collectionName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}


struct CombineSongsView_Previews: PreviewProvider {
    
    static var previews: some View {
        CombineSongsView()
    }
}
