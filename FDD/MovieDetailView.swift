//
//  MovieDetailView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct MovieDetailView: View {
    @Binding var movie: Movie
    var newDescription: String = ""
    var body: some View {
        VStack (spacing: 12) {

            Text("Released in \(String(movie.releaseYear))")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(movie.description)
                .font(.body)
                .foregroundColor(.secondary)
            
                
            
            
            
        }
        .toolbar {
            ToolbarItem (placement: .bottomBar) {
                Button("Edit") {

                }
            }
        }
        .navigationTitle(movie.title)
        
    }
}

#Preview {
    MovieDetailView(
        movie: .constant(Movie(title: "The Matrix", releaseYear: 1999, description: "Här är en beskrivning"))
    )
}

