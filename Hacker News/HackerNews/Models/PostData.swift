//
//  PostData.swift
//  Hacker News
//
//  Created by Matthew Wong on 2023-07-18.
//

import Foundation

// Algolia API JSON returns an array of posts
// Decodable: JSON --> struct
// Encodable: struct --> JSON
struct Results: Decodable {
    let hits: [Post]
}

// Identifiable needs `id` property
struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
