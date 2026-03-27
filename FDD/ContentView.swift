//
//  ContentView.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import SwiftUI

struct Movie: Identifiable, Hashable {
    let id = UUID()
    var title: String
    let releaseYear: Int
    var description: String = ""

}

struct ContentView: View {

    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Film", systemImage: "film.stack")
                }
            AboutView()
                .tabItem {
                    Label("Om", systemImage: "info.circle")
                }
        }
    }
}

struct MoviesView: View {

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
    @State private var searchTerm = ""

    var filteredMovies: [Movie] {
        guard !searchTerm.isEmpty else { return movies }
        return movies.filter {
            $0.title.localizedCaseInsensitiveContains(searchTerm)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredMovies) { movie in
                    NavigationLink {
                        if let index = movies.firstIndex(where: {
                            $0.id == movie.id
                        }) {
                            MovieDetailView(movie: $movies[index])
                        }
                    } label: {
                        HStack {
                            Image(systemName: "movieclapper")
                            Text(movie.title)
                        }
                    }
                }
                .onDelete { movies.remove(atOffsets: $0) }
                .onMove { source, destination in
                    movies.move(fromOffsets: source, toOffset: destination)
                }

            }
            .navigationTitle("Filmdatabas")
            .searchable(text: $searchTerm, prompt: "Sök film")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        newYear = ""
                        newTitle = ""
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
        .popover(isPresented: $showSheet) {
            showAddMovie()
        }
    }

    func showAddMovie() -> some View {
        VStack(spacing: 20) {
            Image(systemName: "popcorn")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .frame(maxWidth: 300, maxHeight: 300, alignment: .center)
            Text("Lägg till film")
            TextField("Titel ...", text: $newTitle)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 50)
            TextField("Publicerad ...", text: $newYear)
                .font(.body)
                .padding(.horizontal, 4)
                .frame(height: 50)
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

struct AboutView: View {
    var body: some View {
        VStack {
            
            Image(systemName: "questionmark.video")
                .resizable()
                .scaledToFit()
                .padding(30)
                
                
                
                
            
            Text("Om appen")
                .font(.largeTitle)
                .padding()
            Text(
                "Denna app är en enkel lista över filmer. Du kan lägga till nya filmer, redigera beskrivningar och ta bort filmer."
            )
            .font(.body)
            .padding()
        }
        .previewDisplayName("Om appen")
    }
}

struct MovieDetailView: View {
    @Binding var movie: Movie
    @State private var isEditing = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("(\(String(movie.releaseYear)))")
                if isEditing {
                    TextEditor(text: $movie.description)
                        .font(.body)
                        .frame(maxWidth: .infinity, minHeight: 200)
                } else {
                    Text(
                        movie.description.isEmpty
                            ? "Lägg till omdömme" : movie.description
                    )
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .font(.body)
                    .foregroundColor(.secondary)
                }

            }
            .scrollDisabled(false)
            .padding(20)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditing ? "Klar" : "Edit") {
                    isEditing.toggle()
                }
            }
        }
        .navigationTitle("\(movie.title) ")
    }
}

#Preview {
    ContentView()
}
