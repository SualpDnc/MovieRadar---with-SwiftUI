//
//  MovieDetailViewModel.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 15.05.2024.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    @Published var movieDetail : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail(imdbId : String) {
        downloaderClient.getMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let movieDetail) :
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel(detail: movieDetail)
                }
               
            }
            
        }
    }
}

struct MovieDetailsViewModel {
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
}
