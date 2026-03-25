//
//  MovieDetailView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var description : String = ""
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text("Released in \(String(movie.releaseYear))")
                .font(.title)
                .foregroundColor(.secondary)
        }
        Text(description)
        Button("Edit"){
            
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "The Matrix", releaseYear: 1999))
}
