//
//  Movie.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 9.05.2024.
//

import Foundation

struct Movie: Codable {
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct Movies : Codable {
    let movies : [Movie]
    
    private enum CodingKeys : String, CodingKey {
        case movies = "Search"
    }
}
