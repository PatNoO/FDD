//
//  MovieDetailView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text("Released in \(movie.releaseYear)")
                .font(.title)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "The Matrix", releaseYear: "1999"))
}
