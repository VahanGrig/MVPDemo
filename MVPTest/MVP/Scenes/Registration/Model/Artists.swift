//
//  Artitetails.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import Foundation

struct Artists: Codable {
    let results: [ArtistData]
}

struct ArtistData: Codable {
    var artist_href: String
    var artist_name: String
    var source_url: String
    var url: String
}
