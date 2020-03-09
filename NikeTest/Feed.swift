//
//  FeedModel.swift
//  NikeTest
//
//  Created by Apple on 3/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation


struct Feeds: Codable {
    var feed: Feed
    enum CodingKeys: String, CodingKey {
        case feed
    }
}

struct Feed: Codable {
    var title: String
    var results: [Artist]

    enum CodingKeys: String, CodingKey {
        case title
        case results 
    }
}

struct Artist: Codable {
    var artistName: String
    var id: String
    var releaseDate: String
    var name: String
    var kind: String
    var copyright: String
    var artistId: String
    var contentAdvisoryRating: String?
    var artistUrl: String
    var artworkUrl100: String
    var genres: [Genres]
    var url: String

   enum CodingKeys: String, CodingKey {
    case artistName
    case id
    case releaseDate
    case name
    case kind
    case copyright
    case artistId
    case contentAdvisoryRating
    case artistUrl
    case artworkUrl100
    case genres
    case url
    }
}

struct Genres: Codable {
    var genreId: String
    var name: String
    var url: String

    enum CodingKeys: String ,CodingKey {
        case genreId
        case name
        case url
    }
}
