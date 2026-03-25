//
//  ContentView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct ContentView: View {
    @State private var movies  = [
        Movie(title: "The Matrix", releaseYear: "1999"),
        Movie(title: "Inception", releaseYear: "2010"),
        Movie(title: "Spirited Away", releaseYear: "2001"),
        Movie(title: "Sagan om Ringen", releaseYear: "2001")
        
    ]
    
    var body: some View {
        NavigationStack {
            List( movies) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    Text(movie.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
