//
//  Movies.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import Foundation

struct Movie : Identifiable, Hashable {
    let id = UUID()
    var title: String
    let releaseYear: Int
    var description: String = ""
    
}
