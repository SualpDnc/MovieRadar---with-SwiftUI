//
//  DownloaderClient.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 9.05.2024.
//

import Foundation

class DownloaderClient{
    
    func GetMovies(search: String, completion: @escaping (Result<[Movie]?,DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f5133d7") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.missingData))
        }
            guard let MovieResponse = try? JSONDecoder().decode(Movies.self, from: data) else {
                return completion(.failure(.dataProblem))
            }
            
            completion(.success(MovieResponse.movies))
        
        }.resume()
    }
    
    func getMovieDetails(imdbId : String, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=f5133d7") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data, error == nil else {
                return completion(.failure(.missingData))
            }
            
            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.dataProblem))
            }
            
            completion(.success(movieDetailResponse))
            
        }.resume()
    }
}

enum DownloaderError: Error {
    case wrongUrl
    case missingData
    case dataProblem
}
