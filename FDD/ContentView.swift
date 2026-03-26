//
//  ContentView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct ContentView: View {
    @State private var movies = [
        Movie(
            title: "The Matrix",
            releaseYear: 1999,
            description:
                "En hacker upptäcker att världen han lever i är en simulerad verklighet skapad av maskiner."
        ),
        Movie(
            title: "Inception",
            releaseYear: 2010,
            description:
                "En skicklig tjuv som stjäl företagshemligheter genom att gå in i folks drömmar får i uppdrag att plantera en idé."
        ),
        Movie(
            title: "Spirited Away",
            releaseYear: 2001,
            description:
                "En ung flicka hamnar i en magisk värld styrd av gudar och andar efter att hennes föräldrar förvandlats till grisar."
        ),
        Movie(
            title: "Sagan om Ringen",
            releaseYear: 2001,
            description:
                "En ung hob får det farliga uppdraget att förstöra en magisk ring för att rädda världen från mörkrets herre."
        ),

    ]

    @State private var showSheet = false
    @State private var newTitle = ""
    @State private var newYear = ""

    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach($movies) { $movie in
                        NavigationLink {
                            MovieDetailView(movie: $movie)
                        } label: {
                            HStack {
                                Image(systemName: "movieclapper")
                                Text(movie.title)
                            }
                        }
                    }
                    .onDelete { movies.remove(atOffsets: $0) }
                }
                .navigationBarTitle("Filmdatabas")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Lägg till film") {
                            newYear = ""
                            newTitle = ""
                            showSheet = true
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                }
            }
            .popover(isPresented: $showSheet) {
                VStack(spacing: 20) {
                    Text("Lägg till film")
                    TextField("Titel ...", text: $newTitle)
                    TextField("Publicerad ...", text: $newYear)
                    HStack(spacing: 20) {
                        Button("Avbryt") {
                            showSheet = false

                        }.foregroundColor(.red)
                        Button("Spara") {

                            if !newTitle.isEmpty, !newYear.isEmpty,
                                let year = Int(newYear)
                            {
                                movies.append(
                                    Movie(title: newTitle, releaseYear: year)
                                )
                                showSheet = false
                            }
                        }.buttonStyle(.borderedProminent)
                    }
                }.padding(20)
            }
        }

    }
}

struct MovieDetailView: View {
    @Binding var movie: Movie
    //    private var newDescription: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Released in \(String(movie.releaseYear))")
                .font(.title)
                .foregroundColor(.secondary)

            TextField(
                "Lägg till handling ...",
                text: $movie.description,
                axis: .vertical
            )
            .lineLimit(5...10)

            .font(.body)
            .foregroundColor(.secondary)

            Spacer()
        }
        .padding(20)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {

                }
            }
        }
        .navigationTitle(movie.title)

    }
}

#Preview {
    ContentView()
}
