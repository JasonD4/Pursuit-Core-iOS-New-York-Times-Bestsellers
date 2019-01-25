//
//  BookModel.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation




struct TypeModel {
   let results: [Type]
}

struct Type {
    let list_name: String
    let display_name: String
    let oldest_published_date: String
    let newest_published_date: String
}
