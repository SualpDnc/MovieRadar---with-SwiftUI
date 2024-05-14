//
//  DetailView.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 15.05.2024.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Spacer()
                SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.2, alignment: .center )
                Spacer()
            }
               
            
            Text(movieDetailViewModel.movieDetail?.title ?? "Movie Name").font(.title2).foregroundColor(.blue).padding()
        
            Text(movieDetailViewModel.movieDetail?.plot ?? "Movie Plot").padding().font(.body)
            
            Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "Director ")").padding()
            
            Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "Writer ")").padding()
            
            Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "Year ")").padding()
            
            Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "Awards ")").padding()
            
            Spacer()
            
        }.onAppear(perform: {
            self.movieDetailViewModel.getMovieDetail(imdbId: imdbId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "Test")
    }
}
