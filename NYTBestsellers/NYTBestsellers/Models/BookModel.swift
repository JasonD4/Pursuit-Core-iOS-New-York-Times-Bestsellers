//
//  BookModel.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookModel: Decodable {
    
    let results: [Books]
}

struct Books: Decodable {
    let list_name: String
    let bestsellers_date: String
    let published_date: String
    let rank: Int
    let weeks_on_list: Int
    let amazon_product_url: String
    let book_details: [BookInformation]
    let isbns: [IsbnNumber]
}
struct IsbnNumber: Decodable {
    let isbn13: String
}
struct BookInformation: Decodable {
    let title: String
    let description: String
    let contributor: String
    let author: String
    let age_group: String?
    let publisher: String
}
