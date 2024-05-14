//
//  SpecialImage.swift
//  MovieRadar
//
//  Created by Sualp Danacı on 13.05.2024.
//

import SwiftUI

struct SpecialImage: View {
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String){
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder2")
                .resizable()
        }
    }
}

struct SpecialImage_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImage(url: "https://m.media-amazon.com/images/M/MV5BMmFiMTczYjgtMWQwOC00MjFlLWFlZjUtMjJjNTcxNjAzY2Q1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg")
    }
}
