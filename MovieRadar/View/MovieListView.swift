//
//  ContentView.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 9.05.2024.
//

import SwiftUI


struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var movieToSearch = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()

    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                TextField("Search Movie", text: $movieToSearch, onEditingChanged:{ _ in}, onCommit: {
                    self.movieListViewModel
                        .searchMovie(movieName: movieToSearch.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? movieToSearch)
                }).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                List(movieListViewModel.movies, id: \.imdbId) {
                    movie in
                    NavigationLink(
                        destination: DetailView(imdbId:movie.imdbId),
                        label:{
                            HStack(){
                                SpecialImage(url: movie.poster)
                                    .frame(width: 90, height: 130)
                                
                                VStack(alignment: .leading){
                                    Text(movie.title)
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                    
                                    Text(movie.year)
                                        .foregroundColor(.orange)
                                }
                            }
                        })
                 
                }.navigationTitle(Text("Movie Radar 🍿"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
