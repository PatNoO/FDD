//
//  ContentView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct ContentView: View {
    @State private var movies = [
        Movie(title: "The Matrix", releaseYear: 1999),
        Movie(title: "Inception", releaseYear: 2010),
        Movie(title: "Spirited Away", releaseYear: 2001),
        Movie(title: "Sagan om Ringen", releaseYear: 2001),

    ]

    @State private var showSheet = false
    @State private var newTitle = ""
    @State private var newYear = ""

    var body: some View {
        VStack {
            NavigationStack {
                List(movies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        HStack {
                            Image(systemName: "movieclapper")
                            Text(movie.title)
                        }
                    }
                }
                .navigationBarTitle("Filmdatabas")
            }
            Spacer()
            Button("Lägg till film") {
                newYear = ""
                newTitle = ""
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 20) {
                    Text("Lägg till film")
                    TextField("Titel ...", text: $newTitle)
                    TextField("Publicerad ...", text: $newYear)
                    Button("Spara") {

                        if !newTitle.isEmpty, !newYear.isEmpty,
                            let year = Int(newYear)
                        {
                            movies.append(
                                Movie(title: newTitle, releaseYear: year)
                            )
                            showSheet = false
                        }
                    }
                }.padding(20)
            }
        }

    }
}

#Preview {
    ContentView()
}
