//
//  ServiceApple.swift
//  NikeTest
//
//  Created by Apple on 3/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct ContentService {
    func getAlbumData(handler: @escaping (Result<[Artist]?, Error>) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { handler(.failure(error!)); return }
            let decoder = JSONDecoder()
            let artists = try? decoder.decode(Feeds.self, from: data)
            handler(.success(artists?.feed.results)) 
        }.resume()
    }
}
