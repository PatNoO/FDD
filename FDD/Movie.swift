//
//  Movies.swift
//  FDD
//
//  Created by Patrik Noordh on 2026-03-25.
//

import Foundation

struct Movie : Identifiable, Hashable {
    let id = UUID()
    let title: String
    let releaseYear: String
    
}
