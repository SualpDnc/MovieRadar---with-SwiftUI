//
//  ImageDownloaderClient.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 13.05.2024.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    @Published var downloadedImage : Data?
    
    func downloadImage(url: String){
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data,response,error) in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
            
        }.resume()
    }
}
