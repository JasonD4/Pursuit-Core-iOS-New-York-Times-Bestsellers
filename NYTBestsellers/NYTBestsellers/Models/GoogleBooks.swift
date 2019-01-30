//
//  GoogleBooks.swift
//  NYTBestsellers
//
//  Created by Jason on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBooks: Decodable {
    let items: [GBooks]?
}
struct GBooks: Decodable {
    let volumeInfo: G_Books
}

struct G_Books: Decodable {
    let description: String?
//    let categories: [String]
    let imageLinks: PictureLink
}

struct PictureLink: Decodable {
    let thumbnail: String?
}
