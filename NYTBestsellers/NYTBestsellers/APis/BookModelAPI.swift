//
//  BookModelAPI.swift
//  NYTBestsellers
//
//  Created by Jason on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

private let apiKey = "Wl8DnnK55dBA899QkYDGNZajIbJ7He8p"

public final class BookAPI{
        private init(){}
        
        static var catagory = "Hardcover+Fiction"
    
        public static var bookEndPoint: String {
            // im ccalling you now do something
             let bookAPI = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(apiKey)&list=\(catagory)"
            return bookAPI
            
        }
    
    static func typeData(complete: @escaping( AppError?, [Books]?) -> Void)  {
        var book = [Books]()
        NetworkHelper.shared.performDataTask(endpointURLString: bookEndPoint) { (error, data) in
            if let error = error{
                complete(error,nil)
            }
            else if let data = data{
                do{
                    book = try JSONDecoder().decode(BookModel.self, from: data).results
                    complete(nil, book)
                }
                catch{
                    complete(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    
    }

