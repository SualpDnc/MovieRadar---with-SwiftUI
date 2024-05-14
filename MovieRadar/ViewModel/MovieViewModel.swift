//
//  MovieViewModel.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 9.05.2024.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()

    func searchMovie(movieName : String) {
        downloaderClient.GetMovies(search: movieName) { (result) in
            switch result{
            case.failure(let error):
                print(error)
            case.success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movies = movieArray.map(MovieViewModel.init)
                    }
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
}
